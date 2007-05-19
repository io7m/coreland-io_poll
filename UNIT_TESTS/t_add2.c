#include <stdlib.h>
#include <corelib/alloc.h>
#include <corelib/close.h>
#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_core.h"
#include "t_assert.h"
#include "t_verify.h"

#define MAX_FDS 64
int fds[MAX_FDS];

struct io_poll iop;

int main(void)
{
  struct io_pollfd ifd;
  unsigned long ind;
  unsigned long asize;

  check_core();

  init_core(&iop);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  for (ind = 0; ind < MAX_FDS; ++ind)
    test_assert((fds[ind] = open("./t_add2.c", O_RDONLY)) != -1);

  /* add all file descriptors */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    test_assert(io_poll_add(&iop, &ifd) == 1);
    test_assert(io_poll_add(&iop, &ifd) == 0);
    test_assert(io_poll_check(&iop, &ifd) == 1);
    test_assert(io_poll_size(&iop) == ind + 1);
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS);
  asize = array_size_ub(&iop.fds);

  /* remove all file descriptors */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    test_assert(io_poll_rm(&iop, &ifd) == 1);
    test_assert(io_poll_rm(&iop, &ifd) == 0);
    test_assert(io_poll_check(&iop, &ifd) == 0);
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == 0);

  /* check that re-adding file descriptors does not enlarge arrays */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    test_assert(io_poll_add(&iop, &ifd) == 1);
    test_assert(io_poll_add(&iop, &ifd) == 0);
    test_assert(io_poll_check(&iop, &ifd) == 1);
    test_assert(io_poll_size(&iop) == ind + 1);
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS);
  test_assert(asize == array_size_ub(&iop.fds));

  /* refuse to add closed file descriptors */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    test_assert(close(fds[ind]) != -1);
    test_assert(io_poll_add(&iop, &ifd) == 0);
    test_assert(io_poll_size(&iop) == MAX_FDS);
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS);
  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
