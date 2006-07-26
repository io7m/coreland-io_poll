#include <corelib/bin.h>
#include <corelib/error.h>

#include "io_poll.h"
#include "select.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_add_kqueue(struct io_poll *iop, int fd, unsigned short flags)
{
  return 0;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static int iop_add_epoll(struct io_poll *iop, int fd, unsigned short flags)
{
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
static int iop_add_poll(struct io_poll *iop, int fd, unsigned short flags)
{
  return 0;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_add_select(struct io_poll *iop, int fd, unsigned short flags)
{
  return 0;
}
#endif /* HAVE_SELECT */

int io_poll_add(struct io_poll *iop, int fd, unsigned short flags)
{
#ifdef HAVE_KQUEUE
  return iop_add_kqueue(iop, fd, flags);
#endif
#ifdef HAVE_EPOLL
  return iop_add_epoll(iop, fd, flags);
#endif
#ifdef HAVE_POLL
  return iop_add_poll(iop, fd, flags);
#endif
#ifdef HAVE_SELECT
  return iop_add_select(iop, fd, flags);
#endif
  return -1;
}
