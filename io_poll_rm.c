#include <fcntl.h>

#include "bin.h"
#include "error.h"

#include "io_poll.h"
#include "select.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_rm_kqueue(struct io_poll *iop, unsigned long n)
{
  int kfd;
  struct kevent *kein;
  struct io_pollfd *fds;
  int ret;

  kein = (struct kevent *) iop->pd_in;
  kfd = iop->pfd;
  fds = iop->fds;

  /* zero io_pollfd so if fds[n].fd is a bad file descriptor, it's
     still zeroed */

  EV_SET(&kein[n], fds[n].fd, kein[n].filter, EV_DELETE, 0, 0, 0);
  bin_zero((char *) &fds[n], sizeof(struct io_pollfd));

  ret = kevent(kfd, &kein[n], 1, 0, 0, 0);
  bin_zero((char *) &kein[n], sizeof(struct kevent));
  fds[n].fd = -1;
  return ret;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
#include <sys/epoll.h>

static int iop_rm_epoll(struct io_poll *iop, unsigned long n)
{
  int pfd;
  struct epoll_event *evs;
  struct io_pollfd *fds;
  int ret;

  evs = (struct epoll_event *) iop->pd_in;
  pfd = iop->pfd;
  fds = iop->fds;

  bin_zero((char *) &fds[n], sizeof(struct io_pollfd));

  ret = epoll_ctl(pfd, EPOLL_CTL_DEL, evs[n].data.fd, &evs[n]);
  bin_zero((char *) &evs[n], sizeof(struct epoll_event));
  fds[n].fd = -1;
  return ret;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static int iop_rm_poll(struct io_poll *iop, unsigned long n)
{
  struct io_pollfd *fds;
  struct pollfd *pfds;
  int ret;

  fds = iop->fds;
  pfds = (struct pollfd *) iop->pd_in;

  /* check for bad fd and set errno, for uniformity */
  ret = fcntl(fds[n].fd, F_GETFL, 0);

  bin_zero((char *) &fds[n], sizeof(struct io_pollfd));
  bin_zero((char *) &pfds[n], sizeof(struct pollfd));
  fds[n].fd = -1;
  return ret;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_rm_select(struct io_poll *iop, unsigned long n)
{
  struct io_pollfd *fds;
  struct fd_sets *fdset;
  int ret;

  fds = iop->fds;
  fdset = (struct fd_sets *) iop->pd_in;

  /* check for bad fd and set errno, for uniformity */
  ret = fcntl(fds[n].fd, F_GETFL, 0);

  if (fds[n].events & IO_POLL_READ) FD_CLR(fds[n].fd, &fdset->readfds);
  if (fds[n].events & IO_POLL_WRITE) FD_CLR(fds[n].fd, &fdset->writefds);

  bin_zero((char *) &fds[n], sizeof(struct io_pollfd));
  fds[n].fd = -1;
  return ret;
}
#endif /* HAVE_SELECT */

int io_poll_rm(struct io_poll *iop, unsigned long n)
{
  unsigned long num;
  num = iop->len;
  if (n >= num) return -1;

#ifdef HAVE_KQUEUE
  return iop_rm_kqueue(iop, n);
#endif
#ifdef HAVE_EPOLL
  return iop_rm_epoll(iop, n);
#endif
#ifdef HAVE_POLL
  return iop_rm_poll(iop, n);
#endif
#ifdef HAVE_SELECT
  return iop_rm_select(iop, n);
#endif
  return -1;
}
