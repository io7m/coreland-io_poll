#include <fcntl.h>

#include "error.h"

#include "io_poll.h"
#include "select.h"

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_register_kqueue(struct io_poll *iop)
{
  unsigned long num;
  unsigned long ind;
  struct kevent *kein;
  struct io_pollfd *fds;
  struct io_pollfd *ifd;
  struct iop_fdhash *fdhash;
  unsigned int iop_f;
  int kfd;
  int fd;
 
  fdhash = (struct iop_fdhash *) &iop->fdhash;
  kein = (struct kevent *) iop->pd_in;
  kfd = iop->pfd;
  fds = iop->fds;
  num = iop->len;

  for (ind = 0; ind < num; ++ind) {
    ifd = &fds[ind];
    fd = ifd->fd;
    iop_f = ifd->events;
    switch (iop_fdhash_add(fdhash, fd)) {
      case -1: return -1;
       case 0: errno = error_exist; return -1;
      default: break;
    }
    EV_SET(&kein[ind], fd, io_poll_flags_io2kq(iop_f), EV_ADD, 0, 1, 0);
  }
  return kevent(kfd, kein, num, 0, 0, 0);
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
#include <sys/epoll.h>

static int iop_register_epoll(struct io_poll *iop)
{
  struct epoll_event *evs;
  struct epoll_event *evp;
  struct io_pollfd *fds;
  struct io_pollfd *ifd;
  unsigned long len;
  unsigned long ind;
  unsigned int iop_f;
  int pfd;

  fds = iop->fds;
  evs = iop->pd_in;
  len = iop->len;
  pfd = iop->pfd;

  for (ind = 0; ind < len; ++ind) {
    evp = &evs[ind];
    ifd = &fds[ind];
    iop_f = ifd->events;
    evp->events = io_poll_flags_io2ep(iop_f);
    evp->data.fd = ifd->fd;
    if (epoll_ctl(pfd, EPOLL_CTL_ADD, ifd->fd, evp) == -1) return -1;
  }
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static int iop_register_poll(struct io_poll *iop)
{
  struct iop_fdhash *fdhash;
  struct io_pollfd *fds;
  struct pollfd *pfds;
  unsigned long len; 
  unsigned long ind;
  int fd;

  fdhash = &iop->fdhash;
  pfds = (struct pollfd *) iop->pd_in;
  fds = iop->fds;
  len = iop->len;

  for (ind = 0; ind < len; ++ind) {
    fd = fds[ind].fd;
    if (fcntl(fd, F_GETFL, 0) == -1) return -1;
    switch (iop_fdhash_add(fdhash, fd)) {
      case -1: return -1;
       case 0: errno = error_exist; return -1;
      default: break;
    }
    pfds[ind].fd = fd;
    pfds[ind].events = io_poll_flags_io2po(fds[ind].events);
  }

  return 0;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_register_select(struct io_poll *iop)
{
  struct iop_fdhash *fdhash;
  struct io_pollfd *fds;
  struct fd_sets *fdset;
  unsigned long len;
  unsigned long ind;
  unsigned int flags;
  int fd;

  fdhash = &iop->fdhash;
  fdset = (struct fd_sets *) iop->pd_in;
  fds = iop->fds;
  len = iop->len;

  for (ind = 0; ind < len; ++ind) {
    fd = fds[ind].fd;
    flags = fds[ind].events;
    if (fcntl(fd, F_GETFL, 0) == -1) return -1;
    switch (iop_fdhash_add(fdhash, fd)) {
      case -1: return -1;
       case 0: errno = error_exist; return -1;
      default: break;
    }
    if (flags & IO_POLL_READ) FD_SET(fd, &fdset->readfds);
    if (flags & IO_POLL_WRITE) FD_SET(fd, &fdset->writefds);
  }

  return 0;
}
#endif /* HAVE_SELECT */

int io_poll_register(struct io_poll *iop)
{
#ifdef HAVE_KQUEUE
  return iop_register_kqueue(iop);
#endif
#ifdef HAVE_EPOLL
  return iop_register_epoll(iop);
#endif
#ifdef HAVE_POLL
  return iop_register_poll(iop);
#endif
#ifdef HAVE_SELECT
  return iop_register_select(iop);
#endif
  return -1;
}
