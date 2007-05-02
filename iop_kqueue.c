#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_KQUEUE)
int iop_kqu_init(struct io_poll *iop)
{

}

int iop_kqu_free(struct io_poll *iop)
{

}

int iop_kqu_add(struct io_poll *iop, struct io_pollfd *pfd, unsigned long len)
{

}

int iop_kqu_del(struct io_poll *iop, int fd)
{

}

long iop_kqu_wait(struct io_poll *iop, int64 t)
{

}

static const struct io_poll_core iop_core_kqueue = {
  &iop_kqu_init,
  &iop_kqu_free,
  &iop_kqu_add,
  &iop_kqu_del,
  &iop_kqu_wait,
};

const struct io_poll_core *io_poll_core_kqueue = &iop_core_kqueue;
#else
const struct io_poll_core *io_poll_core_kqueue = 0;
#endif
