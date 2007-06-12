#include <stdlib.h>
#include <unistd.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/nonblock.h>

#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_core.h"
#include "t_assert.h"
#include "t_verify.h"

struct io_poll iop;
int pfd[2];

int main(void)
{
  struct io_pollfd ifd;
  struct io_pollfd *rfds;
  unsigned long len;
  char buf[4];

  check_core();

  init_core(&iop);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  test_assert(pipe(pfd) != -1);
  test_assert(nonblock(pfd[1]) != -1);
  test_assert(nonblock(pfd[0]) != -1);

  /* test for readability */
  ifd.events = IO_POLL_READ;
  ifd.fd = pfd[0];
  test_assert(io_poll_add(&iop, &ifd) == 1);
  
  /* pipe gets readability and EOF */
  test_assert(write(pfd[1], "AAAA", 4) == 4);
  test_assert(close(pfd[1]) != -1);

  test_assert(io_poll_wait(&iop, 0) == 1);
  io_poll_rfds(&iop, &rfds, &len);
  test_assert(len == 1);
  test_assert(rfds[0].fd == ifd.fd);
  test_assert(io_poll_got_read(&rfds[0]));
  test_assert(read(rfds[0].fd, buf, 4) == 4);
  test_assert(bin_same(buf, "AAAA", 4) == 1);

  /* eof is set */
  test_assert(io_poll_wait(&iop, 0) == 1);
  io_poll_rfds(&iop, &rfds, &len);
  test_assert(len == 1);
  test_assert(rfds[0].fd == ifd.fd);
  test_assert(read(rfds[0].fd, buf, 4) == 0 || io_poll_got_eof(&rfds[0]));
 
  test_assert(io_poll_rm(&iop, &ifd) == 1);
  test_assert(close(pfd[0]) != -1);
  test_assert(io_poll_free(&iop));
  return 0;
}
