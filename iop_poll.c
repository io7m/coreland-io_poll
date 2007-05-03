#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_POLL)
#include <corelib/bin.h>
#include <corelib/error.h>
#include <poll.h>

/* various kernel bugs mean that it's better to always check
   for POLLHUP and POLLERR */

static unsigned int io_poll_flags_io2po(unsigned int iof)
{
  unsigned int pf;
  pf = 0;
  if (iof & IO_POLL_READ) pf |= POLLIN | POLLERR | POLLHUP;
  if (iof & IO_POLL_WRITE) pf |= POLLOUT | POLLERR | POLLHUP;
  if (iof & IO_POLL_ERROR) pf |= POLLERR;
  if (iof & IO_POLL_EOF) pf |= POLLHUP;
  return pf;
}
static unsigned int io_poll_flags_po2io(unsigned int pf)
{
  unsigned int iof;
  iof = 0;
  if (pf & POLLIN) iof |= IO_POLL_READ;
  if (pf & POLLOUT) iof |= IO_POLL_WRITE;
  if (pf & POLLERR) iof |= IO_POLL_ERROR;
  if (pf & POLLHUP) iof |= IO_POLL_EOF;
  return iof;
}

static int iop_poll_init(struct io_poll *iop)
{
  struct array po_ifds;
  struct array po_ofds;
  int es = 0;

  array_zero(&po_ifds);
  array_zero(&po_ofds);

  if (!array_init(&po_ifds, 16, sizeof(struct pollfd))) { es = errno; goto FAIL; }
  if (!array_init(&po_ofds, 16, sizeof(struct pollfd))) { es = errno; goto FAIL; }

  iop->pd_in = po_ifds;
  iop->pd_out = po_ofds;
  return 1;

  FAIL:
  if (array_data(&po_ifds)) array_free(&po_ifds);
  if (array_data(&po_ofds)) array_free(&po_ofds);
  errno = es;
  return 0;
}

static int iop_poll_free(struct io_poll *iop)
{
  array_free(&iop->pd_in);
  array_free(&iop->pd_out);
  return 1;
}

static int iop_poll_add(struct io_poll *iop, const struct io_pollfd *pfd)
{
  struct pollfd pofd;
  struct pollfd *poptr = 0;
  struct io_pollfd *ifd = 0;
  unsigned long ind;
  int add_fds = 0;
  int add_rfd = 0;
  int add_pdi = 0;
  int add_pdo = 0;
  int es;

  if (!io_poll_find_unused(&iop->fds, &ind)) {
    add_fds = array_cat(&iop->fds, pfd);
    if (!add_fds) { es = errno; goto FAIL; }
    add_rfd = array_cat(&iop->rfds, pfd);
    if (!add_rfd) { es = errno; goto FAIL; }
    add_pdi = array_cat(&iop->pd_in, &pofd);
    if (!add_pdi) { es = errno; goto FAIL; }
    add_pdo = array_cat(&iop->pd_out, &pofd);
    if (!add_pdo) { es = errno; goto FAIL; }
    ind = array_size(&iop->fds) - 1;
  }
 
  poptr = array_index(&iop->pd_in, ind);
  ifd = array_index(&iop->fds, ind);

  bin_zero(poptr, sizeof(struct pollfd));
  ifd->fd = pfd->fd;
  ifd->events = pfd->events;

  poptr->fd = pfd->fd;
  poptr->events = io_poll_flags_io2po(pfd->events);
  poptr->revents = 0;
  return 1;

  FAIL:
  if (ifd) ifd->fd = -1;
  if (poptr) bin_zero(poptr, sizeof(struct pollfd));
  if (add_fds) array_chop(&iop->fds, array_size(&iop->fds) - 1);
  if (add_rfd) array_chop(&iop->rfds, array_size(&iop->rfds) - 1);
  if (add_pdi) array_chop(&iop->pd_in, array_size(&iop->pd_in) - 1);
  if (add_pdo) array_chop(&iop->pd_out, array_size(&iop->pd_out) - 1);
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
  struct pollfd *pfd;
  unsigned long ind;
  unsigned long len;
  long ret;

  pfd = array_data(&iop->pd_in);
  len = array_size(&iop->pd_in);

  ret = poll(pfd, len, ms);
  if (ret == -1) return -1;
  if (ret == 0) return 0;

  for (ind = 0; ind < (unsigned long) ret; ++ind) {
    if (pfd[ind].revents) {
      rfd.fd = pfd[ind].fd;
      rfd.events = io_poll_flags_po2io(pfd[ind].revents);
      if (!array_cat(&iop->pd_out, &rfd)) return -1;
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
