#include "io_poll.h"

unsigned long io_poll_size(const struct io_poll *iop)
{
  return iop->size;
}
