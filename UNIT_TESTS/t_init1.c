#include "../io_poll.h"
#include "t_assert.h"
#include "t_verify.h"

struct io_poll iop;

void setcore(struct io_poll *);

int main(void)
{
  setcore(&iop);

  test_assert(io_poll_init(&iop) == 1);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);
  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
