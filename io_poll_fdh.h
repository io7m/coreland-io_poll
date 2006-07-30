#ifndef FD_HASH_H
#define FD_HASH_H

#define FD_HASH_BUCKETS 4

struct iop_fdhash_node {
  int fd;
  struct iop_fdhash_node *next;
};

struct iop_fdhash {
  struct iop_fdhash_node slots[FD_HASH_BUCKETS];
};

int iop_fdhash_init(struct iop_fdhash *);
int iop_fdhash_add(struct iop_fdhash *, int fd);
int iop_fdhash_rm(struct iop_fdhash *, int fd);
int iop_fdhash_free(struct iop_fdhash *);

#endif
