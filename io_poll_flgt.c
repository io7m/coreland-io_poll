#include "io_poll.h"
#include "io_poll_impl.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

unsigned int io_poll_flags_io2kq(unsigned int iof)
{
  unsigned int kf;
  kf = 0;
  if (iof & IO_POLL_READ) kf |= EVFILT_READ;
  if (iof & IO_POLL_WRITE) kf |= EVFILT_WRITE;
  if (iof & IO_POLL_ERROR) kf |= EV_ERROR;
  if (iof & IO_POLL_EOF) kf |= EV_EOF;
  return kf;
}
unsigned int io_poll_flags_kq2io(unsigned int kf)
{
  unsigned int iof;
  iof = 0;
  if (kf & EVFILT_READ) iof |= IO_POLL_READ;
  if (kf & EVFILT_WRITE) iof |= IO_POLL_WRITE;
  if (kf & EV_ERROR) iof |= IO_POLL_ERROR;
  if (kf & EV_EOF) iof |= IO_POLL_EOF;
  return iof;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
#include <sys/epoll.h>

unsigned int io_poll_flags_io2ep(unsigned int iof)
{
  unsigned int ef;
  ef = 0;
  if (iof & IO_POLL_READ) ef |= EPOLLIN;
  if (iof & IO_POLL_WRITE) ef |= EPOLLOUT;
  if (iof & IO_POLL_ERROR) ef |= EPOLLERR;
  if (iof & IO_POLL_EOF) ef |= EPOLLHUP;
  return ef;
}
unsigned int io_poll_flags_ep2io(unsigned int ef)
{
  unsigned int iof;
  iof = 0;
  if (ef & EPOLLIN) iof |= IO_POLL_READ;
  if (ef & EPOLLOUT) iof |= IO_POLL_WRITE;
  if (ef & EPOLLERR) iof |= IO_POLL_ERROR;
  if (ef & EPOLLHUP) iof |= IO_POLL_EOF;
  return iof;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

/* various kernel bugs mean that it's better to always check
   for POLLHUP and POLLERR */

unsigned int io_poll_flags_io2po(unsigned int iof)
{
  unsigned int pf;
  pf = 0;
  if (iof & IO_POLL_READ) pf |= POLLIN | POLLERR | POLLHUP;
  if (iof & IO_POLL_WRITE) pf |= POLLOUT | POLLERR | POLLHUP;
  if (iof & IO_POLL_ERROR) pf |= POLLERR;
  if (iof & IO_POLL_EOF) pf |= POLLHUP;
  return pf;
}
unsigned int io_poll_flags_po2io(unsigned int pf)
{
  unsigned int iof;
  iof = 0;
  if (pf & POLLIN) iof |= IO_POLL_READ;
  if (pf & POLLOUT) iof |= IO_POLL_WRITE;
  if (pf & POLLERR) iof |= IO_POLL_ERROR;
  if (pf & POLLHUP) iof |= IO_POLL_EOF;
  return iof;
}
#endif /* HAVE_POLL */
