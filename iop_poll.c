#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_POLL)
#include <corelib/bin.h>
#include <corelib/error.h>
#include <poll.h>

/* iop->pd_in   used to hold pollfd structures.
 * iop->pd_out  unused.
 */

static int iop_poll_init(struct io_poll *iop)
{
  struct array po_ifds;
  int es = 0;

  array_zero(&po_ifds);
  if (!array_init(&po_ifds, 16, sizeof(struct pollfd))) { es = errno; goto FAIL; }

  iop->pd_in = po_ifds;
  array_zero(&iop->pd_out);
  return 1;

  FAIL:
  if (array_data(&po_ifds)) array_free(&po_ifds);
  errno = es;
  return 0;
}

static int iop_poll_free(struct io_poll *iop)
{
  array_free(&iop->pd_in);
  return 1;
}

static int iop_poll_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct pollfd dummy_pofd;
  struct io_pollfd dummy_pfd;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  int es;

  dummy_pfd.fd = -1;
  dummy_pfd.events = 0;

  /* allocate extra space on arrays if necessary */
  if (!io_poll_find_unused(&iop->fds, &ind)) {
    if (!array_cat(&iop->fds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->rfds, &dummy_pfd)) { es = errno; goto FAIL; }
    if (!array_cat(&iop->pd_in, &dummy_pofd)) { es = errno; goto FAIL; }
    ind = array_size(&iop->fds) - 1;
  }
 
  ifd = array_index(&iop->fds, ind);
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  errno = es;
  return 0;
}

static int iop_poll_del(struct io_poll *iop, int fd)
{
  struct io_pollfd *ifd = 0;
  unsigned long ind;

  if (!io_poll_find(&iop->fds, fd, &ind)) return 0;
  ifd = array_index(&iop->fds, ind);
  ifd->fd = -1;
  ifd->events = 0;
  return 1;
}

static int iop_poll_wait(struct io_poll *iop, int64 ms)
{
  struct io_pollfd rfd;
  struct io_pollfd *ifd;
  struct pollfd *pfdp;
  struct pollfd pfd;
  unsigned long ind;
  unsigned long len;
  long ret;

  array_trunc(&iop->pd_in);
  len = array_size(&iop->fds);
  for (ind = 0; ind < len; ++ind) {
    ifd = array_index(&iop->fds, ind);
    if (ifd->fd != -1) {
      pfd.fd = ifd->fd;
      pfd.events = 0;
      if (ifd->events & IO_POLL_READ) pfd.events |= POLLIN | POLLHUP | POLLERR;
      if (ifd->events & IO_POLL_WRITE) pfd.events |= POLLOUT | POLLHUP | POLLERR;
      pfd.revents = 0; 
      if (!array_cat(&iop->pd_in, &pfd)) return -1;
    }
  }

  pfdp = array_data(&iop->pd_in);
  len = array_size(&iop->pd_in);

  ret = poll(pfdp, len, ms);
  if (ret == -1) return -1;
  if (ret == 0) return 0;

  array_trunc(&iop->rfds);
  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    if (pfdp[ind].revents) {
      rfd.fd = pfdp[ind].fd;
      rfd.events = 0;
      if (pfdp[ind].revents & POLLIN) rfd.events |= IO_POLL_READ;
      if (pfdp[ind].revents & POLLOUT) rfd.events |= IO_POLL_WRITE;
      if (pfdp[ind].revents & POLLHUP) rfd.events |= IO_POLL_EOF;
      if (pfdp[ind].revents & POLLERR) rfd.events |= IO_POLL_ERROR;
      if (!array_cat(&iop->rfds, &rfd)) return -1;
    }
  }

  return 1;
}

static const struct io_poll_core iop_core_poll = {
  &iop_poll_init,
  &iop_poll_free,
  &iop_poll_add,
  &iop_poll_del,
  &iop_poll_wait,
};

const struct io_poll_core *io_poll_core_poll = &iop_core_poll;
#else
const struct io_poll_core *io_poll_core_poll = 0;
#endif
