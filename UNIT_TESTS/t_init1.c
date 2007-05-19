#include "../io_poll.h"
#include "t_core.h"
#include "t_assert.h"
#include "t_verify.h"

struct io_poll iop;

int main(void)
{
  check_core();

  init_core(&iop);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);
  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
