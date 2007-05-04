#ifndef IO_POLL_IMPL_H
#define IO_POLL_IMPL_H

#include "_aio-mech.h"

int io_poll_find_unused(const struct array *, unsigned long *);
int io_poll_find(const struct array *, int fd, unsigned long *);
int io_poll_fd_check(const struct io_poll *, const struct io_pollfd *);

#endif
