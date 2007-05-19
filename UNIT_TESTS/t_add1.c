#include "../io_poll.h"
#include "t_assert.h"
#include "t_core.h"
#include "t_verify.h"

struct io_poll iop;

/* basic descriptor tests */

int main(void)
{
  struct io_pollfd ifd;

  check_core();

  init_core(&iop);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  /* adding an invalid file descriptor is an error */
  ifd.fd = -1;
  ifd.events = IO_POLL_READ;
  test_assert(io_poll_add(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  verify(&iop);

  /* adding the poll mechanism's own file descriptor is an error */
  ifd.fd = iop.pfd;
  ifd.events = IO_POLL_WRITE | IO_POLL_READ;
  test_assert(io_poll_add(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  verify(&iop);

  /* adding a file descriptor with no events is an error */
  ifd.fd = 0;
  ifd.events = 0;
  test_assert(io_poll_add(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  verify(&iop);

  /* add a file descriptor, duplicate is error */
  ifd.fd = 0;
  ifd.events = IO_POLL_READ;
  test_assert(io_poll_add(&iop, &ifd) == 1);
  test_assert(io_poll_add(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 1);
  test_assert(io_poll_check(&iop, &ifd) == 1);
  verify(&iop);

  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
