#include <unistd.h>
#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_core.h"
#include "t_assert.h"
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

  test_assert((ifd.fd = open("./t_rm1.c", O_RDONLY)) != -1);
  test_assert(close(ifd.fd) != -1);
  ifd.events = IO_POLL_READ;
  
  /* trying to remove a closed fd is an error */
  test_assert(io_poll_rm(&iop, &ifd) == 0);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  ifd.fd = 0;
  ifd.events = IO_POLL_READ;

  /* trying to remove a nonexistant fd is an error */
  test_assert(io_poll_rm(&iop, &ifd) == 0);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  /* standard add and remove */
  test_assert(io_poll_add(&iop, &ifd) == 1);
  test_assert(io_poll_check(&iop, &ifd) == 1);
  test_assert(io_poll_size(&iop) == 1);
  verify(&iop);

  test_assert(io_poll_rm(&iop, &ifd) == 1);
  test_assert(io_poll_check(&iop, &ifd) == 0);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
