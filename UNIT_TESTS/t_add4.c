#include <stdlib.h>
#include <corelib/alloc.h>
#include <corelib/close.h>
#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_core.h"
#include "t_assert.h"
#include "t_verify.h"

/* this test speficallly attempts to cause problems with the select() core.
 * real code should never work around io_poll_core_select - it should
 * simply react as if the operating system ran out of file descriptors.
 * this code specifically handles io_poll_core_select to test that
 * the rest of the select core code is correct.
 */

#if !defined(FD_SETSIZE)
  #define FD_SETSIZE 1024
#endif

#define MAX_FDS (FD_SETSIZE * 2)
int fds[MAX_FDS];

struct io_poll iop;

int using_select(void)
{
  return io_poll_core(&iop) == io_poll_core_select;
}

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
    test_assert(io_poll_add(&iop, &ifd) == 1
            || (ifd.fd >= FD_SETSIZE - 1 && using_select()));
    test_assert(io_poll_add(&iop, &ifd) == 0);
    test_assert(io_poll_check(&iop, &ifd) == 1
            || (ifd.fd >= FD_SETSIZE - 1 && using_select()));
    test_assert(io_poll_size(&iop) == ind + 1 || using_select());
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS ||
             (io_poll_size(&iop) == FD_SETSIZE - 1 && using_select()));
  asize = array_size_ub(&iop.fds);

  /* remove all odd file descriptors */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    if (ind % 2) {
      ifd.events = IO_POLL_READ;
      ifd.fd = fds[ind];
      test_assert(io_poll_rm(&iop, &ifd) == 1
              || (ifd.fd >= FD_SETSIZE - 1 && using_select()));
      test_assert(io_poll_rm(&iop, &ifd) == 0);
      test_assert(io_poll_check(&iop, &ifd) == 0);
      verify(&iop);
    }
  }
  test_assert(io_poll_size(&iop) == MAX_FDS / 2
          || (io_poll_size(&iop) == (FD_SETSIZE / 2) - 1 && using_select()));

  /* check that re-adding odd file descriptors does not enlarge arrays */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    if (ind % 2 ) {
      test_assert(io_poll_add(&iop, &ifd) == 1
              || (ifd.fd >= FD_SETSIZE - 1 && using_select()));
      test_assert(io_poll_add(&iop, &ifd) == 0);
    }
    verify(&iop);
    test_assert(io_poll_check(&iop, &ifd) == 1
            || (ifd.fd >= FD_SETSIZE - 1 && using_select()));
  }
  test_assert(io_poll_size(&iop) == MAX_FDS ||
             (io_poll_size(&iop) == FD_SETSIZE - 1 && using_select()));
  test_assert(asize == array_size_ub(&iop.fds));

  /* refuse to add closed file descriptors */
  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.events = IO_POLL_READ;
    ifd.fd = fds[ind];
    test_assert(close(fds[ind]) != -1);
    test_assert(io_poll_add(&iop, &ifd) == 0);
    verify(&iop);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS ||
             (io_poll_size(&iop) == FD_SETSIZE - 1 && using_select()));
  test_assert(io_poll_free(&iop) == 1);
  return 0;
}
