#include <corelib/error.h>

#include "io_poll.h"
#include "io_poll_impl.h"
#include "_sd_fcntl.h"

static int iop_fd_check(struct io_poll *iop, const struct io_pollfd *pfd)
{
  return ((pfd->fd != iop->pfd)
          && (pfd->fd != -1)
          && (pfd->events != 0)
          && (fcntl(pfd->fd, F_GETFL, 0) != -1));
}

/* this function is called from the various cores */
int io_poll_find_unused(struct array *arr, unsigned long *ret)
{
  const struct io_pollfd *fd;
  unsigned long ind;

  if (!array_size(arr)) { *ret = 0; return 1; }
  for (ind = 0; ind < array_size(arr); ++ind) {
    fd = array_index(arr, ind);
    if (fd->fd == -1) {
      *ret = ind;
      return 1;
    }
  }
  return 0;
}

int io_poll_add(struct io_poll *iop,
                const struct io_pollfd *pfd, unsigned long len)
{
  const struct io_pollfd *fd;
  unsigned long ind;
  int es = 0;

  for (ind = 0; ind < len; ++ind) {
    fd = &pfd[ind];
    if (!iop_fd_check(iop, pfd)) { errno = EINVAL; goto FAIL; }
    switch (io_poll_fdhash_add(&iop->fdhash, fd->fd)) {
      case 0: es = error_exist; goto FAIL;
      case -1: goto FAIL;
      default: break;
    }
  }

  for (ind = 0; ind < len; ++ind) {
    fd = &pfd[ind];
    if (!iop->core->add(iop, fd)) { es = errno; goto FAIL; }
  }

  return 1;
  FAIL:
  for (ind = 0; ind < len; ++ind) {
    fd = &pfd[ind];
    io_poll_fdhash_rm(&iop->fdhash, fd->fd);
    iop->core->del(iop, fd->fd);
  }
  errno = es;
  return 0;
}

int io_poll_addfd(struct io_poll *iop, int fd, unsigned int events)
{
  struct io_pollfd pfd;
  pfd.fd = fd;
  pfd.events = events;
  return io_poll_add(iop, &pfd, 1);
}
