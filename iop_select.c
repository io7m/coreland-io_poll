#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_SELECT)
#include <corelib/bin.h>
#include <corelib/error.h>

static int iop_sel_init(struct io_poll *iop)
{
  struct array se_isets;
  struct array se_osets;
  int es = 0;

  array_zero(&se_isets);
  array_zero(&se_osets);

  if (!array_init(&se_isets, 1, sizeof(struct fd_sets))) { es = errno; goto FAIL; }
  if (!array_init(&se_osets, 1, sizeof(struct fd_sets))) { es = errno; goto FAIL; }

  iop->pd_in = se_isets;
  iop->pd_out = se_osets;
  return 1;

  FAIL:
  if (array_data(&se_isets)) array_free(&se_isets);
  if (array_data(&se_osets)) array_free(&se_osets);
  errno = es;
  return 0;
}

static int iop_sel_free(struct io_poll *iop)
{
  array_free(&iop->pd_in);
  array_free(&iop->pd_out);
  return 1;
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
