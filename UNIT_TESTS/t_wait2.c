#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>
#include <corelib/nonblock.h>

#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_assert.h"
#include "t_verify.h"

#define MAX_FDS 64

struct pipe { int fd[2]; } pipes[MAX_FDS];
struct io_poll iop;

void setcore(struct io_poll *);

int main(void)
{
  struct io_pollfd ifd;
  struct io_pollfd *rfds;
  unsigned long ind;
  unsigned long len;
  unsigned long asize;
  char buf[4];
  int pid;
  int r;

  setcore(&iop);

  test_assert(io_poll_init(&iop) == 1);
  test_assert(io_poll_size(&iop) == 0);
  verify(&iop);

  for (ind = 0; ind < MAX_FDS; ++ind) {
    test_assert(pipe(pipes[ind].fd) != -1);
    test_assert(nonblock(pipes[ind].fd[0]) != -1);
    test_assert(nonblock(pipes[ind].fd[1]) != -1);
  }

  for (ind = 0; ind < MAX_FDS; ++ind) {
    ifd.fd = pipes[ind].fd[0];
    ifd.events = IO_POLL_READ;
    test_assert(io_poll_add(&iop, &ifd) == 1);
    test_assert(io_poll_check(&iop, &ifd) == 1);
    test_assert(io_poll_size(&iop) == ind + 1);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS);

  for (ind = 0; ind < MAX_FDS; ++ind) {
    if (ind % 2) {
      ifd.fd = pipes[ind].fd[0];
      ifd.events = IO_POLL_READ | IO_POLL_EOF | IO_POLL_ERROR;
      test_assert(io_poll_rm(&iop, &ifd) == 1);
      test_assert(io_poll_check(&iop, &ifd) == 0);
      test_assert(close(pipes[ind].fd[0]) != -1);
      test_assert(close(pipes[ind].fd[1]) != -1);
    }
  }
  test_assert(io_poll_size(&iop) == MAX_FDS / 2);

  for (ind = 0; ind < MAX_FDS; ++ind) {
    if (fcntl(pipes[ind].fd[1], F_GETFL, 0) != -1)
      test_assert(write(pipes[ind].fd[1], "ABCD", 4) != -1);
    errno = 0;
  }

  r = io_poll_wait(&iop, 0);
  test_assert(r != -1);
  test_assert(r != 0);
  test_assert(r == 1);

  io_poll_rfds(&iop, &rfds, &len);
  test_assert(len == MAX_FDS / 2);

  for (ind = 0; ind < len; ++ind) {
    test_assert(read(rfds[ind].fd, buf, 4) == 4);
    test_assert(bin_same(buf, "ABCD", 4));
  }

  test_assert(io_poll_free(&iop));
  return 0;
}
