#include "../io_poll.h"
#include "t_assert.h"

struct io_poll iop;

void setcore(struct io_poll *);

/* basic descriptor tests */

int main(void)
{
  setcore(&iop);

  /* it is an error to change cores whilst there is allocated data */
  test_assert(io_poll_init(&iop) == 1);
  test_assert(io_poll_size(&iop) == 0);
  test_assert(!io_poll_setcore(&iop, io_poll_default_core()));
  test_assert(io_poll_free(&iop) == 1);

  test_assert(io_poll_setcore(&iop, io_poll_default_core()));
  return 0;
}
