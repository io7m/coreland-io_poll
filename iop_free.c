#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_free(struct io_poll *iop)
{
  array_free(&iop->fds);
  array_free(&iop->rfds);
  return iop->core->free(iop);
}
