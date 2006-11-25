#ifndef FD_HASH_H
#define FD_HASH_H

#include <corelib/hashtable.h>

struct iop_fdhash {
  struct hashtable h;
};

int iop_fdhash_init(struct iop_fdhash *);
int iop_fdhash_add(struct iop_fdhash *, int fd);
int iop_fdhash_rm(struct iop_fdhash *, int fd);
int iop_fdhash_free(struct iop_fdhash *);

#endif
