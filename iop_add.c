#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_add(struct io_poll *iop,
                const struct io_pollfd *pfd, unsigned long len)
{
  return 1;
}

int io_poll_addfd(struct io_poll *iop, int fd, unsigned int flags)
{
  return 1;
}
