#include <corelib/error.h>

#include "io_poll.h"
#include "io_poll_impl.h"

int io_poll_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  int es = 0;

  if (!io_poll_fd_check(iop, pfd)) { errno = EINVAL; return 0; }

  switch (io_poll_fdhash_add(&iop->fdhash, pfd->fd)) {
    case 0:
      errno = error_exist;
    case -1:
      return 0;
    default: break;
  }

  if (!iop->core->add(iop, pfd)) {
    es = errno;
    io_poll_fdhash_rm(&iop->fdhash, pfd->fd);
    iop->core->del(iop, pfd->fd);
    errno = es;
    return 0;
  }

  ++iop->size;
  return 1;
}

int io_poll_addfd(struct io_poll *iop, int fd, unsigned int events)
{
  struct io_pollfd pfd;
  pfd.fd = fd;
  pfd.events = events;
  return io_poll_add(iop, &pfd);
}
