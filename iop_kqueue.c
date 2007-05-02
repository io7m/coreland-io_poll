#include "io_poll.h"
#include "io_poll_impl.h"

#if defined(HAVE_KQUEUE)
#include <corelib/close.h>
#include <corelib/error.h>

#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

int iop_kqu_init(struct io_poll *iop)
{
  struct array ke_ifds;
  struct array ke_ofds;
  int kfd = -1;
  int es = 0;

  array_zero(&ke_ifds);
  array_zero(&ke_ofds);

  kfd = kqueue();
  if (kfd == -1) { es = errno; goto FAIL; }
  
  if (!array_init(&ke_ifds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }
  if (!array_init(&ke_ofds, 16, sizeof(struct kevent))) { es = errno; goto FAIL; }

  iop->pd_in = ke_ifds;
  iop->pd_out = ke_ofds;
  iop->pfd = kfd;
  return 1;

  FAIL:
  if (array_data(&ke_ifds)) array_free(&ke_ifds);
  if (array_data(&ke_ofds)) array_free(&ke_ofds);
  if (kfd != -1) close(kfd);
  errno = es;
  return 0;
}

int iop_kqu_free(struct io_poll *iop)
{
  array_free(&iop->pd_in);
  array_free(&iop->pd_out);
  return (close(iop->pfd) != -1);
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
