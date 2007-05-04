#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_check(struct io_poll *iop, const struct io_pollfd *pfd)
{
  if (pfd->fd == -1) return 0;
  if (io_poll_fdhash_check(&iop->fdhash, pfd->fd)) return 1;
  return 0;
}

int io_poll_checkfd(struct io_poll *iop, int fd)
{
  struct io_pollfd pfd;
  pfd.fd = fd;
  pfd.events = 0;
  return io_poll_check(iop, &pfd);
}
