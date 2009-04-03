#include "io_poll.h"
#include "io_poll_impl.h"

const struct io_poll_core *io_poll_default_core(void)
{
#if defined(HAVE_KQUEUE)
  return io_poll_core_kqueue;
#elif defined(HAVE_EPOLL)
  return io_poll_core_epoll;
#elif defined(HAVE_DEVPOLL)
  return io_poll_core_devpoll;
#elif defined(HAVE_POLL)
  return io_poll_core_poll;
#elif defined(HAVE_SELECT)
  return io_poll_core_select;
#else
  return 0;
#endif
}

const struct io_poll_core *io_poll_core(const struct io_poll *iop)
{
  return iop->core;
}
