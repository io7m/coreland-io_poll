#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_setcore(struct io_poll *iop, const struct io_poll_core *core)
{
  if (iop->pd_in || iop->pd_out) return 0;
  iop->core = core;
  return 1;
}

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
