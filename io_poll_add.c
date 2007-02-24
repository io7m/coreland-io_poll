#include <fcntl.h>

#include <corelib/alloc.h>
#include <corelib/bin.h>
#include <corelib/error.h>

#include "io_poll.h"

static int find_empty(struct io_pollfd *fds,
                      unsigned long len, unsigned long *pos)
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
  struct iop_fdhash *fdhash;
  struct kevent *kein;
  struct kevent *kout;
  struct kevent *kptr;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long ind;
  int kfd;

  fdhash = &iop->fdhash;
  old_a = iop->a;
  kein = (struct kevent *) iop->pd_in;  
  kout = (struct kevent *) iop->pd_out;
  rfds = iop->rfds;
  fds = iop->fds;
  kfd = iop->pfd;
  len = iop->len;

  switch (iop_fdhash_add(fdhash, fd)) {
    case -1: return -1;
     case 0: errno = error_exist; return -1;
    default: break;
  }

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    kptr = &kein[ind];
    goto SET;
  }

  if (CHECK_OVERFLOW(len)) { errno = error_overflow; goto ERR; }

  /* append */
  if (len + 1 >= old_a) {
    struct io_pollfd *tmpfds;
    struct io_pollfd *tmprfds;
    struct kevent *tmpkein;
    struct kevent *tmpkout;
    unsigned long new_a;
    unsigned int esize;

    new_a = old_a + 1 + IO_POLL_OVERALLOC;
    esize = sizeof(struct io_pollfd);

    tmpfds = alloc(new_a * esize);
    if (!tmpfds) goto ERR;
    tmprfds = alloc(new_a * esize);
    if (!tmprfds) {
      dealloc(tmpfds);
      goto ERR;
    } 

    esize = sizeof(struct kevent);
    tmpkein = alloc(new_a * esize);
    if (!tmpkein) {
      dealloc(tmpfds);
      dealloc(tmprfds);
      goto ERR;
    }
    tmpkout = alloc(new_a * esize);
    if (!tmpkout) {
      dealloc(tmpfds);
      dealloc(tmprfds);
      dealloc(tmpkein);
      goto ERR;
    }

    esize = sizeof(struct io_pollfd);
    bin_copy(fds,  tmpfds,  old_a * esize);
    bin_copy(rfds, tmprfds, old_a * esize);
    esize = sizeof(struct kevent);
    bin_copy(kein, tmpkein, old_a * esize);
    bin_copy(kout, tmpkout, old_a * esize);

    iop->a = new_a;
    iop->pd_in = tmpkein;
    iop->pd_out = tmpkout;
    iop->fds = tmpfds;
    iop->rfds = tmprfds;

    dealloc(kein);
    dealloc(kout);
    dealloc(rfds);
    dealloc(fds);

    kein = (struct kevent *) iop->pd_in;  
    kout = (struct kevent *) iop->pd_out;
    rfds = iop->rfds;
    fds = iop->fds;
  }
  kptr = &kein[len];
  fptr = &fds[len];

  SET:
  fptr->fd = fd;
  fptr->events = flags;
  iop->len = len + 1;

  EV_SET(kptr, fd, io_poll_flags_io2kq(flags), EV_ADD, 0, 1, 0);
  return kevent(kfd, kptr, 1, 0, 0, 0);

  ERR:
  iop_fdhash_rm(fdhash, fd);
  return -1;
}
#endif /* HAVE_KQUEUE */

#ifdef HAVE_EPOLL
#include <sys/epoll.h>

static int iop_add_epoll(struct io_poll *iop, int fd, unsigned int flags)
{
  struct iop_fdhash *fdhash;
  struct epoll_event *evs;
  struct epoll_event *revs;
  struct epoll_event *eptr;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long ind;
  int pfd;

  fdhash = &iop->fdhash;
  old_a = iop->a;
  revs = (struct epoll_event *) iop->pd_out;
  rfds = iop->rfds;
  pfd = iop->pfd;
  evs = (struct epoll_event *) iop->pd_in;  
  fds = iop->fds;
  len = iop->len;

  switch (iop_fdhash_add(fdhash, fd)) {
    case -1: return -1;
     case 0: errno = error_exist; return -1;
    default: break;
  }

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    eptr = &evs[ind];
    goto SET;
  }

  if (CHECK_OVERFLOW(len)) { errno = error_overflow; goto ERR; }

  if (len + 1 >= old_a) {
    struct io_pollfd *tmpfds;
    struct io_pollfd *tmprfds;
    struct epoll_event *tmpevs;
    struct epoll_event *tmprevs;
    unsigned long new_a;
    unsigned int esize;

    new_a = old_a + 1 + IO_POLL_OVERALLOC;
    esize = sizeof(struct io_pollfd);

    tmpfds = alloc(new_a * esize);
    if (!tmpfds) goto ERR;
    tmprfds = alloc(new_a * esize);
    if (!tmprfds) {
      dealloc(tmpfds);
      goto ERR;
    } 

    esize = sizeof(struct epoll_event);
    tmpevs = alloc(new_a * esize);
    if (!tmpevs) {
      dealloc(tmpfds);
      dealloc(tmprfds);
      goto ERR;
    }
    tmprevs = alloc(new_a * esize);
    if (!tmprevs) {
      dealloc(tmpfds);
      dealloc(tmprfds);
      dealloc(tmpevs);
      goto ERR;
    }

    esize = sizeof(struct io_pollfd);
    bin_copy(fds,  tmpfds,  old_a * esize);
    bin_copy(rfds, tmprfds, old_a * esize);
    esize = sizeof(struct epoll_event);
    bin_copy(evs,  tmpevs,  old_a * esize);
    bin_copy(revs, tmprevs, old_a * esize);

    iop->a = new_a;
    iop->pd_in = tmpevs;
    iop->pd_out = tmprevs;
    iop->fds = tmpfds;
    iop->rfds = tmprfds;

    dealloc(evs);
    dealloc(revs);
    dealloc(rfds);
    dealloc(fds);

    evs = (struct epoll_event *) iop->pd_in;  
    revs = (struct epoll_event *) iop->pd_out;
    rfds = iop->rfds;
    fds = iop->fds;
  }
  eptr = &evs[len];
  fptr = &fds[len];
  iop->len = len + 1;

  SET:
  fptr->fd = fd;
  fptr->events = flags;
  eptr->data.fd = fd;
  eptr->events = io_poll_flags_io2ep(flags);

  return epoll_ctl(pfd, EPOLL_CTL_ADD, eptr->data.fd, eptr);
  ERR:
  iop_fdhash_rm(fdhash, fd);
  return -1;
}
#endif /* HAVE_EPOLL */

#ifdef HAVE_POLL
#include <poll.h>

static int iop_add_poll(struct io_poll *iop, int fd, unsigned int flags)
{
  struct iop_fdhash *fdhash;
  struct pollfd *pfds;
  struct pollfd *pptr;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long ind;

  fdhash = &iop->fdhash;
  pfds = (struct pollfd *) iop->pd_in;
  fds = iop->fds;
  rfds = iop->rfds;
  len = iop->len;
  old_a = iop->a;

  switch (iop_fdhash_add(fdhash, fd)) {
    case -1: return -1;
     case 0: errno = error_exist; return -1;
    default: break;
  }

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    pptr = &pfds[ind];
    goto SET;
  }

  if (CHECK_OVERFLOW(len)) { errno = error_overflow; goto ERR; }

  /* append */
  if (len + 1 >= old_a) {
    struct io_pollfd *tmpfds;
    struct io_pollfd *tmprfds;
    struct pollfd *tmppfds;
    unsigned long new_a;
    unsigned int esize;

    new_a = old_a + 1 + IO_POLL_OVERALLOC;
    esize = sizeof(struct io_pollfd);

    tmpfds = alloc(new_a * esize);
    if (!tmpfds) goto ERR;
    tmprfds = alloc(new_a * esize);
    if (!tmprfds) {
      dealloc(tmpfds);
      goto ERR;
    } 

    esize = sizeof(struct pollfd);
    tmppfds = alloc(new_a * esize);
    if (!tmppfds) {
      dealloc(tmpfds);
      dealloc(tmprfds);
      goto ERR;
    }

    esize = sizeof(struct io_pollfd);
    bin_copy(fds,  tmpfds,  esize);
    bin_copy(rfds, tmprfds, esize);
    esize = sizeof(struct pollfd);
    bin_copy(pfds, tmppfds, esize);

    iop->a = new_a;
    iop->pd_in = tmppfds;
    iop->fds = tmpfds;
    iop->rfds = tmprfds;

    dealloc(pfds);
    dealloc(rfds);
    dealloc(fds);

    pfds = (struct pollfd *) iop->pd_in;  
    rfds = iop->rfds;
    fds = iop->fds;
  }
  pptr = &pfds[len];
  fptr = &fds[len];
  iop->len = len + 1;

  SET:
  pptr->fd = fd;
  pptr->events = io_poll_flags_io2po(flags);
  fptr->fd = fd;
  fptr->events = flags;
  return 0;

  ERR:
  iop_fdhash_rm(fdhash, fd);
  return -1;
}
#endif /* HAVE_POLL */

#ifdef HAVE_SELECT
#include "sd_select.h"

static int iop_add_select(struct io_poll *iop, int fd, unsigned int flags)
{
  struct iop_fdhash *fdhash;
  struct fd_sets *fdset;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct io_pollfd *fptr;
  unsigned long len;
  unsigned long old_a;
  unsigned long new_a;
  unsigned long ind;

  fdhash = &iop->fdhash;
  fdset = (struct fd_sets *) iop->pd_in;
  fds = iop->fds;
  rfds = iop->rfds;
  len = iop->len;
  old_a = iop->a;

  switch (iop_fdhash_add(fdhash, fd)) {
    case -1: return -1;
     case 0: errno = error_exist; return -1;
    default: break;
  }

  if (find_empty(fds, len, &ind)) {
    fptr = &fds[ind];
    goto SET;
  }

  /* select() can't handle more than FD_SETSIZE */
  if (len == FD_SETSIZE) { errno = error_overflow; goto ERR; }

  /* redundant */
  if (CHECK_OVERFLOW(len)) { errno = error_overflow; goto ERR; }

  if (len + 1 >= old_a) {
    struct io_pollfd *tmpfds;
    struct io_pollfd *tmprfds;
    unsigned int esize;

    new_a = old_a + 1 + IO_POLL_OVERALLOC;
    esize = sizeof(struct io_pollfd);

    tmpfds = alloc(new_a * esize);
    if (!tmpfds) goto ERR;
    tmprfds = alloc(new_a * esize);
    if (!tmprfds) {
      dealloc(tmpfds);
      goto ERR;
    } 

    bin_copy(fds, tmpfds, esize);
    bin_copy(rfds, tmprfds, esize);
 
    iop->a = new_a;
    iop->fds = tmpfds;
    iop->rfds = tmprfds;

    dealloc(fds);
    dealloc(rfds);

    fds = iop->fds;
    rfds = iop->rfds;
  }
  fptr = &fds[len];
  iop->len = len + 1;

  SET:
  fptr->fd = fd;
  fptr->events = flags;
  if (flags & IO_POLL_READ) FD_SET(fd, &fdset->readfds);
  if (flags & IO_POLL_WRITE) FD_SET(fd, &fdset->writefds);
  return 0;

  ERR:
  iop_fdhash_rm(fdhash, fd);
  return -1;
}
#endif /* HAVE_SELECT */

int io_poll_add(struct io_poll *iop, int fd, unsigned int flags)
{
  /* check for bad or illegal file descriptors */
  if (fcntl(fd, F_GETFL, 0) == -1) return -1;
  if (iop->pfd != -1)
    if (iop->pfd == fd) return -1;

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
