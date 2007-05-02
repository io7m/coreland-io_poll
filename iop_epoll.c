#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_EPOLL)
static int iop_epol_init(struct io_poll *iop)
{
  return 0;
}

static int iop_epol_free(struct io_poll *iop)
{
  return 0;
}

static int iop_epol_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  return 0;
}

static int iop_epol_del(struct io_poll *iop, int fd)
{
  return 0;
}

static long iop_epol_wait(struct io_poll *iop, int64 t)
{
  return 0;
}

static const struct io_poll_core iop_core_epoll = {
  &iop_epol_init,
  &iop_epol_free,
  &iop_epol_add,
  &iop_epol_del,
  &iop_epol_wait,
};

const struct io_poll_core *io_poll_core_epoll = &iop_core_epoll;
#else
const struct io_poll_core *io_poll_core_epoll = 0;
#endif
