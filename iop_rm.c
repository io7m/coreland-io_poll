#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_rm(struct io_poll *iop,
               const struct io_pollfd *pfd, unsigned long len)
{
  return 1;
}

int io_poll_rmfd(struct io_poll *iop, int fd)
{
  return 1;
}
