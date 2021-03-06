#include "t_assert.h"
#include "t_verify.h"

void verify(const struct io_poll *iop)
{
  test_assert(array_size(&iop->fds) == array_size(&iop->rfds));
  test_assert(array_size_ub(&iop->fds) == array_size_ub(&iop->rfds));
}
