#ifndef IO_POLL_FDH_H
#define IO_POLL_FDH_H

#include <corelib/hashtable.h>

struct io_pfdhash {
  struct hashtable h;
};

int io_pfdhash_init(struct io_pfdhash *);
int io_pfdhash_add(struct io_pfdhash *, int fd);
int io_pfdhash_rm(struct io_pfdhash *, int fd);
int io_pfdhash_free(struct io_pfdhash *);

#endif
