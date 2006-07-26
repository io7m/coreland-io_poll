#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>

#include "io_poll.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static long iop_wait_kqueue(struct io_poll *iop, long ms)
{
  int kfd;
  struct timespec ts;
  struct timespec *tsp;
  struct kevent *kout;
  struct io_pollfd *rfds;
  unsigned long len;
  unsigned long ind;
  unsigned short ke_filter;
  unsigned short ke_flags;
  long ret;

  kout = (struct kevent *) iop->pd_out;
  rfds = (struct io_pollfd *) iop->rfds;
  kfd = iop->pfd;
  len = iop->len;
  tsp = &ts;
  if (ms > 0) {
    ms /= 1000000UL; /* ms to nanoseconds */
    ts.tv_sec = 0;
    ts.tv_nsec = ms;
  } else if (ms == 0) {
    ts.tv_sec = 0;
    ts.tv_nsec = 0;
  } else if (ms == -1) {
    tsp = 0;
  }

  ret = kevent(kfd, 0, 0, kout, len, tsp);
  if (ret <= 0) return ret;

  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    ke_filter = kout[ind].filter;
    ke_flags = kout[ind].flags;
    rfds[ind].fd = kout[ind].ident;
    rfds[ind].events |= io_poll_flags_kq2io(ke_filter);
    rfds[ind].events |= io_poll_flags_kq2io(ke_flags);
  }

  return ret;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static long iop_wait_epoll(struct io_poll *iop, long ms)
{
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static long iop_wait_poll(struct io_poll *iop, long ms)
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

static long iop_wait_select(struct io_poll *iop, long ms)
{
  return 0;
}
#endif /* HAVE_SELECT */

long io_poll_wait(struct io_poll *iop, long ms)
{
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
