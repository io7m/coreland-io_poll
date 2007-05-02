#include "../io_poll.h"
#include "t_assert.h"

struct io_poll iop;

void setcore(struct io_poll *);

int main(void)
{
  setcore(&iop);

  test_assert(io_poll_init(&iop));
  test_assert(io_poll_free(&iop));
  return 0;
}
