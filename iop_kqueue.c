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
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  int add_fds = 0;
  int add_rfd = 0;
  int add_pdi = 0;
  int add_pdo = 0;
  int es;
  int r;

  if (!io_poll_find_unused(&iop->fds, &ind)) {
    add_fds = array_cat(&iop->fds, pfd);
    if (!add_fds) { es = errno; goto FAIL; }
    add_rfd = array_cat(&iop->rfds, pfd);
    if (!add_rfd) { es = errno; goto FAIL; }
    add_pdi = array_cat(&iop->pd_in, &kev);
    if (!add_pdi) { es = errno; goto FAIL; }
    add_pdo = array_cat(&iop->pd_out, &kev);
    if (!add_pdo) { es = errno; goto FAIL; }
    ind = array_size(&iop->fds) - 1;
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
  if (add_fds) array_chop(&iop->fds, array_size(&iop->fds) - 1);
  if (add_rfd) array_chop(&iop->rfds, array_size(&iop->rfds) - 1);
  if (add_pdi) array_chop(&iop->pd_in, array_size(&iop->pd_in) - 1);
  if (add_pdo) array_chop(&iop->pd_out, array_size(&iop->pd_out) - 1);
  errno = es;
  return 0;
}

static int iop_kqu_del(struct io_poll *iop, int fd)
{
  return 0;
}

static long iop_kqu_wait(struct io_poll *iop, int64 t)
{
  return 0;
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
