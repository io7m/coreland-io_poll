#include <corelib/error.h>

#include "io_poll.h"
#include "io_poll_impl.h"
#include "_sd_fcntl.h"

static int io_poll_fd_rm_check(const struct io_poll *iop,
                               const struct io_pollfd *pfd)
{
  return ((pfd->fd != iop->pfd)
          && (pfd->fd != -1)
          && (fcntl(pfd->fd, F_GETFL, 0) != -1));
}

int io_poll_rm(struct io_poll *iop, const struct io_pollfd *pfd)
{
  if (!io_poll_fd_rm_check(iop, pfd)) { errno = EINVAL; return 0; }

  switch (io_poll_fdhash_rm(&iop->fdhash, pfd->fd)) {
    case 0: errno = error_noent; return 0;
    default: break;
  }

  if (!iop->core->del(iop, pfd->fd)) return 0;

  --iop->size;
  return 1;
}

int io_poll_rmfd(struct io_poll *iop, int fd)
{
  struct io_pollfd pfd;
  pfd.fd = fd;
  pfd.events = IO_POLL_READ;  /* value is unimportant here */
  return io_poll_rm(iop, &pfd);
}
