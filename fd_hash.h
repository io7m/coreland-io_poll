#ifndef FD_HASH_H
#define FD_HASH_H

#define FD_HASH_BUCKETS 128

struct fd_hash_node {
  int fd;
  struct fd_hash_node *next;
};

struct fd_hash {
  struct fd_hash_node slots[FD_HASH_BUCKETS];
};

int fd_hash_init(struct fd_hash *);
int fd_hash_add(struct fd_hash *, int fd);
int fd_hash_rm(struct fd_hash *, int fd);
int fd_hash_free(struct fd_hash *);

#endif
