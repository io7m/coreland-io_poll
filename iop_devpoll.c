#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_DEVPOLL)
static int iop_devp_init(struct io_poll *iop)
{
  return 0;
}

static int iop_devp_free(struct io_poll *iop)
{
  return 0;
}

static int iop_devp_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  return 0;
}

static int iop_devp_del(struct io_poll *iop, int fd)
{
  return 0;
}

static int iop_devp_wait(struct io_poll *iop, int64 t)
{
  return 0;
}

static const struct io_poll_core iop_core_devpoll = {
  &iop_devp_init,
  &iop_devp_free,
  &iop_devp_add,
  &iop_devp_del,
  &iop_devp_wait,
};

const struct io_poll_core *io_poll_core_devpoll = &iop_core_devpoll;
#else
const struct io_poll_core *io_poll_core_devpoll = 0;
#endif
