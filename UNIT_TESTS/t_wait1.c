#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/close.h>
#include <corelib/error.h>
#include <corelib/nonblock.h>
#include <corelib/sig.h>

#include "../io_poll.h"
#include "../_sd_fcntl.h"
#include "t_assert.h"
#include "t_verify.h"

#define MAX_FDS 64

struct pipe { int fd[2]; } pipes[MAX_FDS];
struct io_poll iop;

void setcore(struct io_poll *);

void catch_hup(int sig)
{
  write(2, "info: caught sig_hangup\n", 24);
}

void child_main(void)
{
  unsigned long ind;

  for (ind = 0; ind < MAX_FDS; ++ind)
    test_assert(write(pipes[ind].fd[1], "ABCD", 4) != -1);

  test_assert(kill(getppid(), sig_hangup) != -1);

  write(2, "info: child exiting\n", 20);
  _exit(0);
}

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
    ifd.events = IO_POLL_READ | IO_POLL_EOF | IO_POLL_ERROR;
    test_assert(io_poll_add(&iop, &ifd) == 1);
    test_assert(io_poll_check(&iop, &ifd) == 1);
    test_assert(io_poll_size(&iop) == ind + 1);
  }
  test_assert(io_poll_size(&iop) == MAX_FDS);

  sig_block(sig_hangup);
  sig_catch(sig_hangup, catch_hup);

  test_assert((pid = fork()) != -1);
  switch (pid) {
    case 0: child_main();
    default: break;
  }

  sig_pause();
  errno = 0;

  r = io_poll_wait(&iop, 0);
  test_assert(r != -1);
  test_assert(r != 0);
  test_assert(r == 1);

  io_poll_rfds(&iop, &rfds, &len);

  for (ind = 0; ind < len; ++ind) {
    test_assert(read(pipes[ind].fd[0], buf, 4) == 4);
    test_assert(bin_same(buf, "ABCD", 4));
  }

  test_assert(io_poll_free(&iop));
  return 0;
}
