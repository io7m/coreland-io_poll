#include "alloc.h"
#include "bin.h"
#include "io_poll_fdh.h"

static unsigned int iop_fdhash_hash(int fd)
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
static void clear(struct iop_fdhash_node *slots, unsigned int num)
{
  unsigned int ind;
  for (ind = 0; ind < num; ++ind) {
    slots[ind].fd = -1;
    slots[ind].next = 0;
  }
}

int iop_fdhash_init(struct iop_fdhash *h)
{
  clear(h->slots, FD_HASH_BUCKETS);
  return 1;
}

int iop_fdhash_add(struct iop_fdhash *h, int fd)
{
  struct iop_fdhash_node *n;
  struct iop_fdhash_node *n_next;
  struct iop_fdhash_node *n_prev;
  unsigned int hash;

  /* sanity */
  if (fd == -1) return 0;

  hash = iop_fdhash_hash(fd) % FD_HASH_BUCKETS;
  n = &h->slots[hash];
  n_next = 0;
  n_prev = 0;

  while (n) {
    if (n->fd == fd) return 0;
    if (n->fd == -1) goto SET;
    n_prev = n;
    n_next = n->next;
    n = n->next;
  }

  if (!n) {
    n = alloc(sizeof(struct iop_fdhash_node));
    if (!n) return -1;
    n_next = 0;
  }

  SET:
  n->fd = fd;
  n->next = n_next;
  if (n_prev) n_prev->next = n;
  return 1;
}

int iop_fdhash_rm(struct iop_fdhash *h, int fd)
{
  struct iop_fdhash_node *n;
  struct iop_fdhash_node *n_next;
  struct iop_fdhash_node *n_prev;
  unsigned int hash;

  /* sanity */
  if (fd == -1) return 0;

  hash = iop_fdhash_hash(fd) % FD_HASH_BUCKETS;
  n = &h->slots[hash];
  n_next = 0;
  n_prev = 0;

  while (n) {
    if (n->fd == fd) { n->fd = -1; return 1; }
    n = n->next;
  }
  return 0;
}

int iop_fdhash_free(struct iop_fdhash *h)
{
  unsigned int ind;
  struct iop_fdhash_node *n;
  struct iop_fdhash_node *n_next;

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
