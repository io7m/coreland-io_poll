#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_KQUEUE)
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>

#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

/* iop->pd_in   unused
 * iop->pd_out  used to hold kevent structures returned from kevent()
 */

static int iop_kqu_init(struct io_poll *iop)
{
  struct array ke_ifds;
  struct array ke_ofds;
  int kfd = -1;
  int es = 0;

  array_zero(&ke_ofds);

  kfd = kqueue();
  if (kfd == -1) { es = errno; goto FAIL; }
  
  if (!array_init(&ke_ifds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }
  if (!array_init(&ke_ofds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }

  array_zero(&iop->pd_in);
  iop->pd_out = ke_ofds;
  iop->pfd = kfd;
  return 1;

  FAIL:
  if (array_data(&ke_ifds)) array_free(&ke_ifds);
  if (array_data(&ke_ofds)) array_free(&ke_ofds);
  if (kfd != -1) close(kfd);
  errno = es;
  return 0;
}

static int iop_kqu_free(struct io_poll *iop)
{
  array_free(&iop->pd_out);
  return (close(iop->pfd) != -1);
}

static int iop_kqu_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct kevent kev;
  struct io_pollfd dummy_pfd;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  unsigned long len;
  short filter = 0;
  int es;
  int r;

  dummy_pfd.fd = -1;
  dummy_pfd.events = 0;
  bin_zero(&kev, sizeof(struct kevent));

  /* if necessary, allocate extra space on arrays to hold structures */
  len = array_size(&iop->fds);
  if (!io_poll_find_unused(&iop->fds, &ind)) {
    if (!array_cat(&iop->fds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->rfds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->pd_out, &kev)) { es = errno; goto FAIL; }
    ind = len;
  }
 
  ifd = array_index(&iop->fds, ind);
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;

  if (ifd->events & IO_POLL_READ) filter |= EVFILT_READ;
  if (ifd->events & IO_POLL_WRITE) filter |= EVFILT_WRITE;

  EV_SET(&kev, pfd->fd, filter, EV_ADD, 0, 1, 0);

  r = kevent(iop->pfd, &kev, 1, 0, 0, 0);
  if (r == -1) { es = errno; goto FAIL; }
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  errno = es;
  return 0;
}

static int iop_kqu_del(struct io_poll *iop, int fd)
{
  struct kevent kev;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  short filter = 0;

  if (!io_poll_find(&iop->fds, fd, &ind)) return 0;
  ifd = array_index(&iop->fds, ind);

  if (ifd->events & IO_POLL_READ) filter |= EVFILT_READ;
  if (ifd->events & IO_POLL_WRITE) filter |= EVFILT_WRITE;
  EV_SET(&kev, ifd->fd, filter, EV_DELETE, 0, 0, 0);

  ifd->fd = -1;
  ifd->events = 0;
  return kevent(iop->pfd, &kev, 1, 0, 0, 0) != -1;
}

static int iop_kqu_wait(struct io_poll *iop, int64 ms)
{
  struct timespec ts;
  struct io_pollfd rfd;
  struct timespec *tsp;
  struct kevent *kout;
  unsigned long ind;
  int ret;

  tsp = &ts;
  if (ms == (int64) -1) tsp = 0;
  if (tsp) {
    ts.tv_sec = ms / 1000;
    ms -= (ts.tv_sec) * 1000;
    ts.tv_nsec = ms * (int64) 1000000;
  }

  kout = (struct kevent *) array_data(&iop->pd_out);
  ret = kevent(iop->pfd, 0, 0, kout, iop->size, tsp);
  if (ret == -1) return -1;
  if (ret == 0) return 0;
  
  array_trunc(&iop->rfds);
  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    rfd.fd = kout[ind].ident;
    rfd.events = 0;
    if (kout[ind].filter == EVFILT_READ && kout[ind].data)
      rfd.events |= IO_POLL_READ;
    if (kout[ind].filter == EVFILT_WRITE)
      rfd.events |= IO_POLL_WRITE;
    if (kout[ind].flags & EV_EOF)
      rfd.events |= IO_POLL_EOF;
    if (kout[ind].flags & EV_ERROR)
      rfd.events |= IO_POLL_ERROR;
    if (!array_cat(&iop->rfds, &rfd)) return -1; /* should be impossible */
  }
  return 1;
}

static const struct io_poll_core iop_core_kqueue = {
  &iop_kqu_init,
  &iop_kqu_free,
  &iop_kqu_add,
  &iop_kqu_del,
  &iop_kqu_wait,
};

const struct io_poll_core *io_poll_core_kqueue = &iop_core_kqueue;
#else
const struct io_poll_core *io_poll_core_kqueue = 0;
#endif
