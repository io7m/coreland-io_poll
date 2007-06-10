#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_EPOLL)
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>

#include <sys/epoll.h>

/* iop->pd_in unused
 * iop->pd_out used to hold epollfd structured returned from epoll_wait()
 */

static int iop_epoll_init(struct io_poll *iop)
{
  struct array ep_ofds;
  int efd = -1;
  int es = 0;

  array_zero(&ep_ofds);

  efd = epoll_create(16);
  if (efd == -1) { es = errno; goto FAIL; }
  if (!array_init(&ep_ofds, 16, sizeof(struct epoll_event))) {
    es = errno; goto FAIL;
  }

  array_zero(&iop->pd_in);
  iop->pd_out = ep_ofds;
  iop->pfd = efd;
  return 1;

  FAIL:
  if (array_data(&ep_ofds)) array_free(&ep_ofds);
  if (efd != -1) close(efd);
  errno = es;
  return 0;
}

static int iop_epoll_free(struct io_poll *iop)
{
  array_free(&iop->pd_out);
  return (close(iop->pfd) != -1);
}

static int iop_epoll_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct epoll_event ev;
  struct io_pollfd dummy_pfd;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  unsigned long len;
  int es;
  int r;

  dummy_pfd.fd = -1;
  dummy_pfd.events = 0;
  bin_zero(&ev, sizeof(struct epoll_event));

  /* if necessary, allocate extra space on arrays to hold structures */
  len = array_size(&iop->fds);
  if (!io_poll_find_unused(&iop->fds, &ind)) {
    if (!array_cat(&iop->fds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->rfds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->pd_out, &ev)) { es = errno; goto FAIL; }
    ind = len;
  }

  ifd = array_index(&iop->fds, ind);
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;

  if (ifd->events & IO_POLL_READ) ev.events |= EPOLLIN;
  if (ifd->events & IO_POLL_WRITE) ev.events |= EPOLLOUT;

  ev.data.fd = ifd->fd;
  r = epoll_ctl(iop->pfd, EPOLL_CTL_ADD, ifd->fd, &ev);
  if (r == -1) { es = errno; goto FAIL; }
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  errno = es;
  return 0;
}

static int iop_epoll_del(struct io_poll *iop, int fd)
{
  struct epoll_event ev;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  int sfd;

  if (!io_poll_find(&iop->fds, fd, &ind)) return 0;
  ifd = array_index(&iop->fds, ind);

  sfd = ifd->fd;
  ifd->fd = -1;
  ifd->events = 0;

  /* ev is ignored but in kernels < 2.6.9, ev must be non-null */
  return epoll_ctl(iop->pfd, EPOLL_CTL_DEL, sfd, &ev) != -1;
}

static int iop_epoll_wait(struct io_poll *iop, int64 t)
{
  struct epoll_event *ep_out;
  struct io_pollfd *ifd;
  int max;
  int ind;
  int r;

  max = array_size(&iop->pd_out);
  ep_out = array_data(&iop->pd_out);

  r = epoll_wait(iop->pfd, ep_out, max, t);
  if (r == -1) return 0;

  for (ind = 0; ind < r; ++ind) {
    ifd = array_index(&iop->rfds, ind);
    ifd->fd = ep_out[ind].data.fd;
    ifd->events = 0;
    if (ep_out[ind].events & EPOLLIN) ifd->events |= IO_POLL_READ;
    if (ep_out[ind].events & EPOLLOUT) ifd->events |= IO_POLL_WRITE;
    if (ep_out[ind].events & EPOLLERR) ifd->events |= IO_POLL_ERROR;
    if (ep_out[ind].events & EPOLLHUP) ifd->events |= IO_POLL_EOF;
  }
  return 1;
}

static const struct io_poll_core iop_core_epoll = {
  &iop_epoll_init,
  &iop_epoll_free,
  &iop_epoll_add,
  &iop_epoll_del,
  &iop_epoll_wait,
};

const struct io_poll_core *io_poll_core_epoll = &iop_core_epoll;
#else
const struct io_poll_core *io_poll_core_epoll = 0;
#endif
