#include "io_poll.h"

int io_poll_iomech(void)
{
#ifdef HAVE_KQUEUE
  return IO_POLL_KQUEUE;
#endif
#ifdef HAVE_EPOLL
  return IO_POLL_EPOLL;
#endif
#ifdef HAVE_POLL
  return IO_POLL_POLL;
#endif
#ifdef HAVE_SELECT
  return IO_POLL_SELECT;
#endif
  return 0;
}
