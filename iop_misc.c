#include <corelib/error.h>

#include "io_poll.h"
#include "io_poll_impl.h"
#include "_sd_fcntl.h"

int io_poll_find_unused(const struct array *arr, unsigned long *ret)
{
  const struct io_pollfd *pfd;
  unsigned long ind;
  unsigned long len;

  len = array_size(arr);
  for (ind = 0; ind < len; ++ind) {
    pfd = array_index(arr, ind);
    if (pfd->fd == -1) {
      *ret = ind;
      return 1;
    }
  }
  return 0;
}

int io_poll_find(const struct array *arr, int fd, unsigned long *ret)
{
  const struct io_pollfd *pfd;
  unsigned long ind;
  unsigned long len;

  len = array_size(arr);
  for (ind = 0; ind < len; ++ind) {
    pfd = array_index(arr, ind);
    if (pfd->fd == fd) {
      *ret = ind;
      return 1;
    }
  }
  return 0;
}
