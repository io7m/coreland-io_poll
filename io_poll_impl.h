#ifndef IO_POLL_IMPL_H
#define IO_POLL_IMPL_H

#include "_io-notice.h"

int io_poll_find_unused(const struct array *, unsigned long *);
int io_poll_find(const struct array *, int fd, unsigned long *);

#endif
