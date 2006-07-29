#include "alloc.h"
#include "bin.h"
#include "close.h"
#include "error.h"

#include "io_poll.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_free_kqueue(struct io_poll *iop)
{
  if (close(iop->pfd) == -1) return -1;
  dealloc(iop->pd_in);
  dealloc(iop->pd_out);
  dealloc(iop->fds);
  dealloc(iop->rfds);

  bin_zero((char *) iop, sizeof(struct io_poll));
  return 0;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static int iop_free_epoll(struct io_poll *iop)
{
  if (close(iop->pfd) == -1) return -1;
  dealloc(iop->pd_in);
  dealloc(iop->pd_out);
  dealloc(iop->fds);
  dealloc(iop->rfds);

  bin_zero((char *) iop, sizeof(struct io_poll));
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
static int iop_free_poll(struct io_poll *iop)
{
  dealloc(iop->pd_in);
  dealloc(iop->fds);
  dealloc(iop->rfds);

  bin_zero((char *) iop, sizeof(struct io_poll));
  return 0;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_free_select(struct io_poll *iop)
{
  dealloc(iop->pd_in);
  dealloc(iop->fds);
  dealloc(iop->rfds);

  bin_zero((char *) iop, sizeof(struct io_poll));
  return 0;
}
#endif /* HAVE_SELECT */

int io_poll_free(struct io_poll *iop)
{
#ifdef HAVE_KQUEUE
  return iop_free_kqueue(iop);
#endif
#ifdef HAVE_EPOLL
  return iop_free_epoll(iop);
#endif
#ifdef HAVE_POLL
  return iop_free_poll(iop);
#endif
#ifdef HAVE_SELECT
  return iop_free_select(iop);
#endif
  return -1;
}
