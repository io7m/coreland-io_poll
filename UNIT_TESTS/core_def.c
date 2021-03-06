#include "../io_poll.h"
#include "t_core.h"
#include "t_assert.h"

void check_core(void)
{
  test_assert(io_poll_default_core() != 0);
}

void init_core(struct io_poll *iop)
{
  test_assert(io_poll_initcore(iop, io_poll_default_core()) == 1);
}
