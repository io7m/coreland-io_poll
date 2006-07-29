#include <fcntl.h>

#include "alloc.h"
#include "bin.h"
#include "error.h"

#include "io_poll.h"
#include "select.h"

static int find_empty(struct io_pollfd *fds, unsigned long len,
                      unsigned long *pos)
{
  unsigned long ind;
  /* empty space before len? */
  for (ind = 0; ind < len; ++ind) {
    if ((fds[ind].fd == -1) && (!fds[ind].events)) {
      *pos = ind;
      return 1;
    }
  }
  return 0;
}

#define CHECK_OVERFLOW(n) (((n) + 1) < (n))

#ifdef HAVE_KQUEUE
#include <sys/types.h>
#include <sys/event.h>
#include <sys/time.h>

static int iop_add_kqueue(struct io_poll *iop, int fd, unsigned int flags)
{
  struct kevent *kein;
  struct kevent *kout;
  struct kevent *kptr;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long new_a;
  unsigned long ind;
  unsigned long es;
  int kfd;

  kfd = iop->pfd;
  kein = (struct kevent *) iop->pd_in;  
  kout = (struct kevent *) iop->pd_out;
  fds = iop->fds;
  rfds = iop->rfds;
  len = iop->len;
  old_a = iop->a;

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    kptr = &kein[ind];
    goto SET;
  }

  if (CHECK_OVERFLOW(len)) { errno = error_overflow; return -1; }

  /* append */
  ++len;
  if (len >= old_a) {
    new_a = old_a + IO_POLL_ALLOC + IO_POLL_OVERALLOC;
    es = sizeof(struct io_pollfd);
    if (!alloc_re((void **) &fds, old_a * es, new_a * es)) return -1;
    if (!alloc_re((void **) &rfds, old_a * es, new_a * es)) return -1;
    es = sizeof(struct kevent);
    if (!alloc_re((void **) &kein, old_a * es, new_a * es)) return -1;
    if (!alloc_re((void **) &kout, old_a * es, new_a * es)) return -1;
    iop->a = new_a;
    iop->pd_in = kein;
    iop->pd_out = kout;
    iop->fds = fds;
    iop->rfds = rfds;
  }
  kptr = &kein[len];
  fptr = &fds[len];
  iop->len = len;

  SET:
  fptr->fd = fd;
  fptr->events = flags;

  EV_SET(kptr, fd, io_poll_flags_io2kq(flags), EV_ADD, 0, 1, 0);
  return kevent(kfd, kptr, 1, 0, 0, 0);
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
static int iop_add_epoll(struct io_poll *iop, int fd, unsigned int flags)
{
  return 0;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static int iop_add_poll(struct io_poll *iop, int fd, unsigned int flags)
{
  struct pollfd *pfds;
  struct pollfd *pptr;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long new_a;
  unsigned long ind;
  unsigned long es;

  pfds = (struct pollfd *) iop->pd_in;
  fds = iop->fds;
  rfds = iop->rfds;
  len = iop->len;
  old_a = iop->a;

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    pptr = &pfds[ind];
    goto SET;
  }

  if (CHECK_OVERFLOW(len)) { errno = error_overflow; return -1; }

  /* append */
  ++len;
  if (len >= old_a) {
    new_a = old_a + IO_POLL_ALLOC + IO_POLL_OVERALLOC;
    es = sizeof(struct io_pollfd);
    if (!alloc_re((void **) &fds, old_a * es, new_a * es)) return -1;
    if (!alloc_re((void **) &rfds, old_a * es, new_a * es)) return -1;
    es = sizeof(struct pollfd);
    if (!alloc_re((void **) &pfds, old_a * es, new_a * es)) return -1;
    iop->a = new_a;
    iop->pd_in = pfds;
    iop->fds = fds;
    iop->rfds = rfds;
  }
  pptr = &pfds[len];
  fptr = &fds[len];
  iop->len = len;

  SET:
  pptr->fd = fd;
  pptr->events = io_poll_flags_io2po(flags);
  fptr->fd = fd;
  fptr->events = flags;
  return 0;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "select.h"

static int iop_add_select(struct io_poll *iop, int fd, unsigned int flags)
{
  struct fd_sets *fdset;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long new_a;
  unsigned long ind;
  unsigned long es;

  fdset = (struct fd_sets *) iop->pd_in;
  fds = iop->fds;
  rfds = iop->rfds;
  len = iop->len;
  old_a = iop->a;

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    goto SET;
  }

  /* select() can't handle more than FD_SETSIZE */
  if (len == FD_SETSIZE) { errno = error_overflow; return -1; }

  /* redundant */
  if (CHECK_OVERFLOW(len)) { errno = error_overflow; return -1; }

  ++len;
  if (len >= old_a) {
    new_a = old_a + IO_POLL_ALLOC + IO_POLL_OVERALLOC;
    es = sizeof(struct io_pollfd);
    if (!alloc_re((void **) &fds, old_a * es, new_a * es)) return -1;
    if (!alloc_re((void **) &rfds, old_a * es, new_a * es)) return -1;
    iop->a = new_a;
    iop->fds = fds;
    iop->rfds = rfds;
  }
  fptr = &fds[len];
  iop->len = len;

  SET:
  fptr->fd = fd;
  fptr->events = flags;
  if (flags & IO_POLL_READ) FD_SET(fd, &fdset->readfds);
  if (flags & IO_POLL_WRITE) FD_SET(fd, &fdset->writefds);
  return 0;
}
#endif /* HAVE_SELECT */

int io_poll_add(struct io_poll *iop, int fd, unsigned int flags)
{
  /* check for bad file descriptors */
  if (fcntl(fd, F_GETFL, 0) == -1) return -1;

#ifdef HAVE_KQUEUE
  return iop_add_kqueue(iop, fd, flags);
#endif
#ifdef HAVE_EPOLL
  return iop_add_epoll(iop, fd, flags);
#endif
#ifdef HAVE_POLL
  return iop_add_poll(iop, fd, flags);
#endif
#ifdef HAVE_SELECT
  return iop_add_select(iop, fd, flags);
#endif
  return -1;
}
