#include "io_poll.h"
#include "io_poll_impl.h"

const struct io_poll_core *io_poll_default_core(void)
{
#if defined(HAVE_KQUEUE)
  return io_poll_core_kqueue;
#endif
#if defined(HAVE_EPOLL)
  return io_poll_core_epoll;
#endif
#if defined(HAVE_DEVPOLL)
  return io_poll_core_devpoll;
#endif
#if defined(HAVE_POLL)
  return io_poll_core_poll;
#endif
#if defined(HAVE_SELECT)
  return io_poll_core_select;
#endif
  return 0;
}

const struct io_poll_core *io_poll_core(const struct io_poll *iop)
{
  return iop->core;
}
