#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_KQUEUE)
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>

#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

/* event flag conversion */
static unsigned int io_poll_flags_io2kq(unsigned int iof)
{
  unsigned int kf;
  kf = 0;
  if (iof & IO_POLL_READ) kf |= EVFILT_READ;
  if (iof & IO_POLL_WRITE) kf |= EVFILT_WRITE;
  if (iof & IO_POLL_ERROR) kf |= EV_ERROR;
  if (iof & IO_POLL_EOF) kf |= EV_EOF;
  return kf;
}
static unsigned int io_poll_flags_kq2io(unsigned int kf)
{
  unsigned int iof;
  iof = 0;
  if (kf & EVFILT_READ) iof |= IO_POLL_READ;
  if (kf & EVFILT_WRITE) iof |= IO_POLL_WRITE;
  if (kf & EV_ERROR) iof |= IO_POLL_ERROR;
  if (kf & EV_EOF) iof |= IO_POLL_EOF;
  return iof;
}

static int iop_kqu_init(struct io_poll *iop)
{
  struct array ke_ifds;
  struct array ke_ofds;
  int kfd = -1;
  int es = 0;

  array_zero(&ke_ifds);
  array_zero(&ke_ofds);

  kfd = kqueue();
  if (kfd == -1) { es = errno; goto FAIL; }
  
  if (!array_init(&ke_ifds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }
  if (!array_init(&ke_ofds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }

  iop->pd_in = ke_ifds;
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
  array_free(&iop->pd_in);
  array_free(&iop->pd_out);
  return (close(iop->pfd) != -1);
}

static int iop_kqu_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct kevent kev;
  struct kevent *kep = 0;
  struct io_pollfd dummy;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  unsigned long len;
  int add_fds = 0;
  int add_rfd = 0;
  int add_pdi = 0;
  int add_pdo = 0;
  int es;
  int r;

  dummy.fd = -1;
  dummy.events = 0;

  len = array_size(&iop->fds);
  if (!io_poll_find_unused(&iop->fds, &ind)) {
    add_fds = array_cat(&iop->fds, &dummy);
    if (!add_fds) { es = errno; goto FAIL; }
    add_rfd = array_cat(&iop->rfds, &dummy);
    if (!add_rfd) { es = errno; goto FAIL; }
    add_pdi = array_cat(&iop->pd_in, &kev);
    if (!add_pdi) { es = errno; goto FAIL; }
    add_pdo = array_cat(&iop->pd_out, &kev);
    if (!add_pdo) { es = errno; goto FAIL; }
    ind = len;
  }
 
  kep = array_index(&iop->pd_in, ind);
  ifd = array_index(&iop->fds, ind);

  bin_zero(kep, sizeof(struct kevent));
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;

  EV_SET(kep, pfd->fd, io_poll_flags_io2kq(pfd->events), EV_ADD, 0, 1, 0);

  r = kevent(iop->pfd, kep, 1, 0, 0, 0);
  if (r == -1) { es = errno; goto FAIL; }
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  if (kep) bin_zero(kep, sizeof(struct kevent));
  errno = es;
  return 0;
}

static int iop_kqu_del(struct io_poll *iop, int fd)
{
  struct kevent *kep = 0;
  struct io_pollfd *ifd = 0;
  unsigned long ind;

  if (!io_poll_find(&iop->fds, fd, &ind)) return 0;

  kep = array_index(&iop->pd_in, ind);
  ifd = array_index(&iop->fds, ind);

  EV_SET(kep, ifd->fd, kep->filter, EV_DELETE, 0, 0, 0);
  ifd->fd = -1;
  ifd->events = 0;

  return kevent(iop->pfd, kep, 1, 0, 0, 0) != -1;
}

static int iop_kqu_wait(struct io_poll *iop, int64 ms)
{
  struct timespec ts;
  struct io_pollfd rfd;
  struct timespec *tsp;
  struct kevent *kout;
  unsigned long len;
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
  ret = kevent(iop->pfd, 0, 0, kout, len, tsp);
  if (ret == -1) return -1;
  if (ret == 0) return 0;
  
  array_trunc(&iop->rfds);
  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    rfd.fd = kout[ind].ident;
    rfd.events = io_poll_flags_kq2io(kout[ind].filter);
    rfd.events |= io_poll_flags_kq2io(kout[ind].flags);
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
