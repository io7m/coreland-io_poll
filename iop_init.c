#include "io_poll.h"
#include "io_poll_impl.h"

#include <corelib/error.h>

static int iop_init(struct io_poll *iop, const struct io_poll_core *core)
{
  struct io_poll_fdhash hash;
  struct array fds;
  struct array rfds;
  struct io_pollfd *ifd;
  unsigned long ind;
  unsigned long len;
  int es = 0;

  iop->core = core;

  array_zero(&fds);
  array_zero(&rfds);

  if (!array_init(&fds, 16, sizeof(struct io_pollfd))) { es = errno; goto FAIL; }
  if (!array_init(&rfds, 16, sizeof(struct io_pollfd))) { es = errno; goto FAIL; }
  if (!io_poll_fdhash_init(&hash)) { es = errno; goto FAIL; }

  iop->pfd = -1;
  if (!core->init(iop)) { es = errno; goto FAIL; }

  len = array_size_ub(&fds);
  for (ind = 0; ind < len; ++ind) {
    ifd = array_index_ub(&fds, ind);
    ifd->fd = -1;
  }

  iop->fds = fds;
  iop->rfds = rfds;
  iop->fdhash = hash;
  iop->size = 0;
  return 1;

  FAIL:
  if (array_data(&fds)) array_free(&fds);
  if (array_data(&rfds)) array_free(&rfds);
  io_poll_fdhash_free(&hash);
  return 0;
}

int io_poll_init(struct io_poll *iop)
{
  return iop_init(iop, io_poll_default_core());
}

int io_poll_initcore(struct io_poll *iop, const struct io_poll_core *core)
{
  return iop_init(iop, core);
}
