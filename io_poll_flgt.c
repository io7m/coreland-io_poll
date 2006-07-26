#include "io_poll.h"
#include "select.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

unsigned short io_poll_flags_io2kq(unsigned short iof)
{
  unsigned short kf;
  kf = 0;
  if (iof & IO_POLL_READ) kf |= EVFILT_READ;
  if (iof & IO_POLL_WRITE) kf |= EVFILT_WRITE;
  if (iof & IO_POLL_ERROR) kf |= EV_ERROR;
  if (iof & IO_POLL_EOF) kf |= EV_EOF;
  return kf;
}
unsigned short io_poll_flags_kq2io(unsigned short kf)
{
  unsigned short iof;
  iof = 0;
  if (kf & EVFILT_READ) iof |= IO_POLL_READ;
  if (kf & EVFILT_WRITE) iof |= IO_POLL_WRITE;
  if (kf & EV_ERROR) iof |= IO_POLL_ERROR;
  if (kf & EV_EOF) iof |= IO_POLL_EOF;
  return iof;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static int iop_register_epoll(struct io_poll *iop)
{
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

/* various kernel bugs mean that it's better to always check
   for POLLHUP and POLLERR */

unsigned short io_poll_flags_io2po(unsigned short iof)
{
  unsigned short pf;
  pf = 0;
  if (iof & IO_POLL_READ) pf |= POLLIN | POLLERR | POLLHUP;
  if (iof & IO_POLL_WRITE) pf |= POLLOUT | POLLERR | POLLHUP;
  if (iof & IO_POLL_ERROR) pf |= POLLERR;
  if (iof & IO_POLL_EOF) pf |= POLLHUP;
  return pf;
}
unsigned short io_poll_flags_po2io(unsigned short pf)
{
  unsigned short iof;
  iof = 0;
  if (pf & POLLIN) iof |= IO_POLL_READ;
  if (pf & POLLOUT) iof |= IO_POLL_WRITE;
  if (pf & POLLERR) iof |= IO_POLL_ERROR;
  if (pf & POLLHUP) iof |= IO_POLL_EOF;
  return iof;
}
#endif /* HAVE_POLL */
