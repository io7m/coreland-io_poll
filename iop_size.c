#include "io_poll.h"
#include "io_poll_impl.h"

unsigned long io_poll_size(const struct io_poll *iop)
{
  const struct io_pollfd *fd;
  unsigned long ind;
  unsigned long len;
  unsigned long n = 0;

  len = array_size(&iop->fds);
  for (ind = 0; ind < len; ++ind) {
    fd = array_index(&iop->fds, ind);
    if (fd->fd != -1) ++n;
  }
  return n;
}
