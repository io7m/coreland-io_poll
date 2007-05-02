#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_POLL)
int iop_poll_init(struct io_poll *iop)
{

}

int iop_poll_free(struct io_poll *iop)
{

}

int iop_poll_add(struct io_poll *iop, struct io_pollfd *pfd, unsigned long len)
{

}

int iop_poll_del(struct io_poll *iop, int fd)
{

}

long iop_poll_wait(struct io_poll *iop, int64 t)
{

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
