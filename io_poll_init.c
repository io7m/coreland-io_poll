#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>

#include "io_poll.h"

static unsigned long alloc_io_pollfds(struct io_pollfd **pfds,
                                      unsigned long num)
{
  unsigned long allocnum;
  struct io_pollfd *fds;
  allocnum = num + IO_POLL_OVERALLOC;
  fds = alloc(allocnum * sizeof(struct io_pollfd));
  if (!fds) return 0;
  *pfds = fds;
  return allocnum;
}

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_init_kqueue(struct io_poll *iop, unsigned long num)
{
  int err;
  int kfd;
  struct kevent *kein;
  struct kevent *keout;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  unsigned long allocnum;
  unsigned long allocd;

  kfd = kqueue();
  if (kfd == -1) return -1;  

  allocd = alloc_io_pollfds(&fds, num);
  if (!allocd) {
    err = errno;
    close(kfd);
    errno = err;
    return -1;
  }
  allocnum = allocd;
  allocd = alloc_io_pollfds(&rfds, num);
  if (!allocd) {
    err = errno;
    dealloc(fds);
    close(kfd);
    errno = err;
    return -1;
  }
  kein = (struct kevent *) alloc(allocnum * sizeof(struct kevent));
  if (!kein) {
    err = errno;
    dealloc(fds);
    dealloc(rfds);
    close(kfd);
    errno = err;
    return -1;
  }
  keout = (struct kevent *) alloc(allocnum * sizeof(struct kevent));
  if (!keout) {
    err = errno;
    dealloc(fds);
    dealloc(rfds);
    dealloc(kein);
    close(kfd);
    errno = err;
    return -1;
  }

  bin_zero((char *) kein, allocnum * sizeof(struct kevent));
  bin_zero((char *) keout, allocnum * sizeof(struct kevent));
  bin_zero((char *) fds, allocnum * sizeof(struct io_pollfd));
  bin_zero((char *) rfds, allocnum * sizeof(struct io_pollfd));

  iop->fds = fds;
  iop->rfds = rfds;
  iop->pfd = kfd;
  iop->pd_in = kein;
  iop->pd_out = keout; 
  iop->a = allocnum;
  iop->len = num;
  return 0;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static int iop_init_epoll(struct io_poll *iop, unsigned long num)
{
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static int iop_init_poll(struct io_poll *iop, unsigned long num)
{
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct pollfd *pfds;
  unsigned long allocnum;
  unsigned long allocd;

  allocd = alloc_io_pollfds(&fds, num);
  if (!allocd) return -1;
  allocnum = allocd;
  allocd = alloc_io_pollfds(&rfds, num);
  if (!allocd) {
    dealloc(fds);
    return -1;
  }
  pfds = (struct pollfd *) alloc(allocnum * sizeof(struct pollfd));
  if (!pfds) {
    dealloc(rfds);
    dealloc(fds);
    return -1;
  }

  bin_zero((char *) fds, allocnum * sizeof(struct io_pollfd));
  bin_zero((char *) rfds, allocnum * sizeof(struct io_pollfd));
  bin_zero((char *) pfds, allocnum * sizeof(struct pollfd));

  iop->fds = fds;
  iop->rfds = rfds;
  iop->pfd = -1;
  iop->pd_in = pfds;
  iop->pd_out = 0;
  iop->a = allocnum;
  iop->len = num;
  return 0;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_init_select(struct io_poll *iop, unsigned long num)
{
  struct fd_sets *fdset;
  struct fd_sets *rfdset;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  unsigned long allocnum;
  unsigned long allocd;

  if (num >= FD_SETSIZE) { errno = error_overflow; return -1; }

  allocd = alloc_io_pollfds(&fds, num);
  if (!allocd) return -1;
  allocnum = allocd;
  allocd = alloc_io_pollfds(&rfds, num);
  if (!allocd) {
    dealloc(fds);
    return -1;
  }
  fdset = (struct fd_sets *) alloc(sizeof(struct fd_sets));
  if (!fdset) {
    dealloc(rfds);
    dealloc(fds);
    return -1;
  }
  rfdset = (struct fd_sets *) alloc(sizeof(struct fd_sets));
  if (!rfdset) {
    dealloc(fdset);
    dealloc(rfds);
    dealloc(fds);
    return -1;
  }

  FD_ZERO(&fdset->readfds);
  FD_ZERO(&fdset->writefds);
  FD_ZERO(&fdset->exceptfds);
  FD_ZERO(&rfdset->readfds);
  FD_ZERO(&rfdset->writefds);
  FD_ZERO(&rfdset->exceptfds);

  iop->fds = fds;
  iop->rfds = rfds;
  iop->pfd = -1;
  iop->pd_in = fdset;
  iop->pd_out = rfdset;
  iop->a = allocnum;
  iop->len = num;
  return 0;
}
#endif /* HAVE_SELECT */

int io_poll_init(struct io_poll *iop, unsigned long num)
{
#ifdef HAVE_KQUEUE
  return iop_init_kqueue(iop, num);
#endif
#ifdef HAVE_EPOLL
  return iop_init_epoll(iop, num);
#endif
#ifdef HAVE_POLL
  return iop_init_poll(iop, num);
#endif
#ifdef HAVE_SELECT
  return iop_init_select(iop, num);
#endif
  return -1;
}
