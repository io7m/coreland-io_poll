#include "../io_poll.h"
#include "t_assert.h"

void setcore(struct io_poll *iop)
{
  test_assert(io_poll_default_core());
  test_assert(io_poll_setcore(iop, io_poll_default_core()));
}
