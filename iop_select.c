#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_SELECT)
static int iop_sel_init(struct io_poll *iop)
{
  return 0;
}

static int iop_sel_free(struct io_poll *iop)
{
  return 0;
}

static int iop_sel_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  return 0;
}

static int iop_sel_del(struct io_poll *iop, int fd)
{
  return 0;
}

static long iop_sel_wait(struct io_poll *iop, int64 t)
{
  return 0;
}

static const struct io_poll_core iop_core_select = {
  &iop_sel_init,
  &iop_sel_free,
  &iop_sel_add,
  &iop_sel_del,
  &iop_sel_wait,
};

const struct io_poll_core *io_poll_core_select = &iop_core_select;
#else
const struct io_poll_core *io_poll_core_select = 0;
#endif
