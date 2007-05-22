#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_SELECT)
#include <corelib/bin.h>
#include <corelib/error.h>
#include "_sd_select.h"

/* iop->pd_in   allocated to prevent io_poll_setcore() changing active cores
 * iop->pd_out  unused
 */

static int iop_sel_init(struct io_poll *iop)
{
  if (!array_init(&iop->pd_in, 1, 1)) return 0;
  iop->pfd = -1;
  return 1;
}

static int iop_sel_free(struct io_poll *iop)
{
  array_free(&iop->pd_in);
  return 1;
}

static int iop_sel_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct io_pollfd dummy_pfd;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  unsigned long len;
  int es;

  dummy_pfd.fd = -1;
  dummy_pfd.events = 0;

  if ((iop->size == FD_SETSIZE - 1)
     || (pfd->fd == FD_SETSIZE - 1)) { es = EMFILE; goto FAIL; }

  len = array_size(&iop->fds);
  if (!io_poll_find_unused(&iop->fds, &ind)) {
    if (!array_cat(&iop->fds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->rfds, &dummy_pfd)) { es = errno; goto FAIL; }
    ind = len;
  }

  ifd = array_index(&iop->fds, ind);
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  errno = es;
  return 0;
}

static int iop_sel_del(struct io_poll *iop, int fd)
{
  struct io_pollfd *ifd = 0;
  unsigned long ind;

  if (!io_poll_find(&iop->fds, fd, &ind)) return 0;
  ifd = array_index(&iop->fds, ind);
  ifd->fd = -1;
  ifd->events = 0;
  return 1;
}

static int iop_sel_wait(struct io_poll *iop, int64 ms)
{
  fd_set readfds;
  fd_set writefds;
  fd_set errorfds;
  struct timeval tv;
  struct timeval *tvp;
  struct io_pollfd *ifd;
  struct io_pollfd rfd;
  unsigned long len;
  unsigned long ind;
  int high_fd = -1;
  int r;

  FD_ZERO(&readfds);
  FD_ZERO(&writefds);
  FD_ZERO(&errorfds);

  tvp = &tv;
  if (ms == -1) tvp = 0;
  tv.tv_sec = ms / 1000;
  ms -= tv.tv_sec * 1000;
  tv.tv_usec = ms / 1000;

  high_fd = 0;
  len = array_size(&iop->fds);
  for (ind = 0; ind < len; ++ind) {
    ifd = array_index(&iop->fds, ind);
    if (ifd->fd != -1) {
      if (ifd->events & IO_POLL_READ) FD_SET(ifd->fd, &readfds);
      if (ifd->events & IO_POLL_WRITE) FD_SET(ifd->fd, &writefds);
      if (ifd->fd > high_fd) high_fd = ifd->fd;
    }
  }

  r = select(high_fd + 1, &readfds, &writefds, &errorfds, tvp);
  if (r == -1) return -1;
  if (r == 0) return 0;

  array_trunc(&iop->rfds);
  for (ind = 0; ind < len; ++ind) {
    ifd = array_index(&iop->fds, ind);
    if (ifd->fd != -1) {
      rfd.fd = ifd->fd;
      rfd.events = 0;
      if (FD_ISSET(ifd->fd, &readfds)) rfd.events |= IO_POLL_READ;
      if (FD_ISSET(ifd->fd, &writefds)) rfd.events |= IO_POLL_WRITE;
      if (FD_ISSET(ifd->fd, &errorfds)) rfd.events |= IO_POLL_EOF;
      if (rfd.events)
        if (!array_cat(&iop->rfds, &rfd)) return -1;
    }
  }

  return 1;
}

static const struct io_poll_core iop_core_select = {
  &iop_sel_init,
  &iop_sel_free,
  &iop_sel_add,
  &iop_sel_del,
  &iop_sel_wait,
};

const struct io_poll_core *io_poll_core_select = &iop_core_select;
#else
const struct io_poll_core *io_poll_core_select = 0;
#endif
