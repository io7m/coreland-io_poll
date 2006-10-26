#include "alloc.h"
#include "bin.h"
#include "close.h"
#include "error.h"
#include "int64.h"

#include "io_poll.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static long iop_wait_kqueue(struct io_poll *iop, int64 ms)
{
  int kfd;
  struct timespec ts;
  struct timespec *tsp;
  struct kevent *kout;
  struct io_pollfd *rfds;
  unsigned long len;
  unsigned long ind;
  unsigned int ke_filter;
  unsigned int ke_flags;
  long ret;

  kout = (struct kevent *) iop->pd_out;
  rfds = (struct io_pollfd *) iop->rfds;
  kfd = iop->pfd;
  len = iop->len;
  tsp = &ts;

  if (ms == -1) tsp = 0;

  /* break times into seconds + nanoseconds */
  if (tsp) {
    ts.tv_sec = ms / 1000;
    ms -= (ts.tv_sec * 1000);
    ts.tv_nsec = ms * 1000000UL;
  }

  ret = kevent(kfd, 0, 0, kout, len, tsp);
  if (ret <= 0) return ret;

  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    ke_filter = kout[ind].filter;
    ke_flags = kout[ind].flags;
    rfds[ind].fd = kout[ind].ident;
    rfds[ind].events = io_poll_flags_kq2io(ke_filter);
    rfds[ind].events |= io_poll_flags_kq2io(ke_flags);
  }
  return ret;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
#include <sys/epoll.h>

static long iop_wait_epoll(struct io_poll *iop, int64 ms)
{
  int pfd;
  int fd;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct epoll_event *revs;
  unsigned long len;
  unsigned long ind;
  unsigned int flags;
  long ret;

  pfd = iop->pfd;
  fds = iop->fds;
  len = iop->len;
  rfds = iop->rfds;
  revs = (struct epoll_event *) iop->pd_out;

  ret = epoll_wait(pfd, revs, len, ms);
  if (ret <= 0) return ret;

  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    flags = io_poll_flags_ep2io(revs[ind].events);
    fd = revs[ind].data.fd;
    rfds[ind].fd = fd;
    rfds[ind].events = flags;
  }

  return ret;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static long iop_wait_poll(struct io_poll *iop, int64 ms)
{
  struct pollfd *pfds;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  unsigned long len;
  unsigned long ind;
  long ret;
  long num;
  long pos;
 
  pfds = (struct pollfd *) iop->pd_in;
  fds = (struct io_pollfd *) iop->fds;
  rfds = (struct io_pollfd *) iop->rfds;
  len = iop->len;

  ret = poll(pfds, len, ms);
  if (ret <= 0) return ret;
  
  pos = 0;
  num = ret;
  for (ind = 0; ind < len; ++ind) {
    if (!num) break; 
    if (pfds[ind].revents) {
      rfds[pos].fd = pfds[ind].fd;
      rfds[pos].events = io_poll_flags_po2io(pfds[ind].revents);
      pfds[pos].revents = 0;
      --num;
      ++pos;
    }
  }
  return ret;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static long iop_wait_select(struct io_poll *iop, int64 ms)
{
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct fd_sets *fdset;
  struct fd_sets *rfdset;
  struct timeval tv;
  struct timeval *tvp;
  unsigned long len;
  unsigned long ind;
  long pos;
  long ret;
  int fd;
  int incr;

  fds = iop->fds;
  rfds = iop->rfds;
  fdset = (struct fd_sets *) iop->pd_in;
  rfdset = (struct fd_sets *) iop->pd_out;
  len = iop->len;

  tvp = &tv;
  if (ms > 0) ms *= 1000; /* milliseconds to microseconds */
  if (ms == -1) tvp = 0;
  tv.tv_sec = 0;
  tv.tv_usec = ms;

  bin_copy(fdset, rfdset, sizeof(struct fd_sets));

  ret = select(FD_SETSIZE, &rfdset->readfds, &rfdset->writefds, 0, tvp);
  if (ret == -1) return -1;

  pos = 0;
  for (ind = 0; ind < len; ++ind) {
    fd = fds[ind].fd;
    incr = 0;
    rfds[pos].events = 0;
    if (fds[ind].events & IO_POLL_READ) {
      if ((FD_ISSET(fd, &rfdset->readfds))) {
        rfds[pos].fd = fd;
        rfds[pos].events |= IO_POLL_READ;
        incr = 1;
      }
    }
    if (fds[ind].events & IO_POLL_WRITE) {
      if ((FD_ISSET(fd, &rfdset->writefds))) {
        rfds[pos].fd = fd;
        rfds[pos].events |= IO_POLL_WRITE;
        incr = 1;
      }
    }
    pos += incr;
  }
  return pos;
}
#endif /* HAVE_SELECT */

long io_poll_wait(struct io_poll *iop, int64 ms)
{
  if (!iop->len) return 0;
#ifdef HAVE_KQUEUE
  return iop_wait_kqueue(iop, ms);
#endif
#ifdef HAVE_EPOLL
  return iop_wait_epoll(iop, ms);
#endif
#ifdef HAVE_POLL
  return iop_wait_poll(iop, ms);
#endif
#ifdef HAVE_SELECT
  return iop_wait_select(iop, ms);
#endif
  return -1;
}
