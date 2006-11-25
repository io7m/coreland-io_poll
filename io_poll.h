#ifndef IO_POLL_H
#define IO_POLL_H

#include <corelib/int64.h>

#include "aio-mech.h"
#include "io_poll_fdh.h"

#define IO_POLL_OVERALLOC 32

#define IO_POLL_READ  0x1
#define IO_POLL_WRITE 0x2
#define IO_POLL_ERROR 0x4
#define IO_POLL_EOF   0x8

struct io_pollfd {
  int fd;
  unsigned int events;
};

struct io_poll {
  void *pd_in;      /* private mechanism specific data */
  void *pd_out;
  struct io_pollfd *fds;
  struct io_pollfd *rfds;
  struct iop_fdhash fdhash;
  unsigned long len;
  unsigned long a;
  int pfd;
};

int io_poll_init(struct io_poll *, unsigned long);
int io_poll_register(struct io_poll *);
int io_poll_add(struct io_poll *, int, unsigned int);
int io_poll_rm(struct io_poll *, unsigned long);
int io_poll_free(struct io_poll *);
long io_poll_wait(struct io_poll *, int64);

#define io_poll_size(io) ((io)->len)
#define io_poll_fds(io) ((io)->fds)

/* defines for testing specific backends */

#define IO_POLL_KQUEUE 0x1
#define IO_POLL_EPOLL  0x2
#define IO_POLL_POLL   0x3
#define IO_POLL_SELECT 0x4

int io_poll_iomech(void);

/* force usage of specific systems for unit testing */
#ifdef USE_KQUEUE
#undef HAVE_EPOLL
#undef HAVE_SELECT
#undef HAVE_POLL
#endif

#ifdef USE_EPOLL
#undef HAVE_KQUEUE
#undef HAVE_SELECT
#undef HAVE_POLL
#endif

#ifdef USE_SELECT
#undef HAVE_KQUEUE
#undef HAVE_EPOLL
#undef HAVE_POLL
#endif

#ifdef USE_POLL
#undef HAVE_KQUEUE
#undef HAVE_EPOLL
#undef HAVE_SELECT
#endif

/* select() specific data */
#ifdef HAVE_SELECT
#include "select.h"

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
