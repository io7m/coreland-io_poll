#ifndef IO_POLL_IMPL_H
#define IO_POLL_IMPL_H

#include "_aio-mech.h"

/* select() specific data */
#ifdef HAVE_SELECT
#include "_sd_select.h"

struct fd_sets {
  fd_set readfds;
  fd_set writefds;
  fd_set exceptfds; /* unused, currently */
};
#endif

/* flag translation */
#ifdef HAVE_KQUEUE
unsigned int io_poll_flags_io2kq(unsigned int);
unsigned int io_poll_flags_kq2io(unsigned int);
#endif

#ifdef HAVE_EPOLL
unsigned int io_poll_flags_io2ep(unsigned int);
unsigned int io_poll_flags_ep2io(unsigned int);
#endif

#ifdef HAVE_POLL
unsigned int io_poll_flags_io2po(unsigned int);
unsigned int io_poll_flags_po2io(unsigned int);
#endif

#endif
