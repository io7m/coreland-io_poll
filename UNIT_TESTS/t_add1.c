#include "../io_poll.h"
#include "t_assert.h"

struct io_poll iop;

void setcore(struct io_poll *);

int main(void)
{
  struct io_pollfd ifd;

  setcore(&iop);

  test_assert(io_poll_init(&iop) == 1);
  test_assert(io_poll_size(&iop) == 0);

  ifd.fd = 0;
  ifd.events = IO_POLL_READ;
  test_assert(io_poll_add(&iop, &ifd, 1) == 1);
  test_assert(io_poll_add(&iop, &ifd, 1) == 0);
  test_assert(io_poll_size(&iop) == 1);

  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
