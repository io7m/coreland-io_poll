#include "alloc.h"
#include "bin.h"
#include "fd_hash.h"

static unsigned int fd_hash_hash(int fd)
{
  unsigned int h;
  unsigned int ind;
  unsigned char c;
  unsigned char *cfd;

  h = 5381;
  cfd = (unsigned char *) &fd;
  for (ind = 0; ind < sizeof(int); ++ind) {
    c = cfd[ind];
    h = ((h << 5) + h) ^ c;
  }
  return h;
}
static void clear(struct fd_hash_node *slots, unsigned int num)
{
  unsigned int ind;
  for (ind = 0; ind < num; ++ind) {
    slots[ind].fd = -1;
    slots[ind].next = 0;
  }
}

int fd_hash_init(struct fd_hash *h)
{
  clear(h->slots, FD_HASH_BUCKETS);
  return 1;
}

int fd_hash_add(struct fd_hash *h, int fd)
{
  return 0;
}

int fd_hash_rm(struct fd_hash *h, int fd)
{
  return 0;
}

int fd_hash_free(struct fd_hash *h)
{
  unsigned int ind;
  struct fd_hash_node *n;
  struct fd_hash_node *n_next;

  for (ind = 0; ind < FD_HASH_BUCKETS; ++ind) {
    n = h->slots[ind].next;
    while (n) {
      n_next = n->next;
      dealloc(n);
      n = n_next;
    }
  }
  clear(h->slots, FD_HASH_BUCKETS);
  return 1;
}
