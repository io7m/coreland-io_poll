#include "io_poll.h"
#include "io_poll_impl.h"

unsigned long io_poll_size(const struct io_poll *iop)
{
  return array_size(&iop->fds);
}
