#ifndef IO_POLL_FDH_H
#define IO_POLL_FDH_H

#include <corelib/hashtable.h>

struct io_poll_fdhash {
  struct hashtable h;
};

int io_poll_fdhash_init(struct io_poll_fdhash *);
int io_poll_fdhash_add(struct io_poll_fdhash *, int fd);
int io_poll_fdhash_rm(struct io_poll_fdhash *, int fd);
int io_poll_fdhash_free(struct io_poll_fdhash *);

#endif
