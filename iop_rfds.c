#include "io_poll.h"
#include "io_poll_impl.h"

void io_poll_rfds(struct io_poll *iop, struct io_pollfd **fds, unsigned long *len)
{
  *fds = (struct io_pollfd *) array_data(&iop->rfds);
  *len = array_size(&iop->rfds);
}
