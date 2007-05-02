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

int io_poll_find_unused(struct array *, unsigned long *);

#endif
