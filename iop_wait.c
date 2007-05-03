#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_wait(struct io_poll *iop, int64 ms)
{
  return iop->core->wait(iop, ms);
}
