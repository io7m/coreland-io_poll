#include <corelib/alloc.h>
#include <corelib/error.h>
#include <corelib/hashtable.h>
#include <corelib/bin.h>
#include "io_poll_fdh.h"

int iop_fdhash_init(struct iop_fdhash *h)
{
  ht_init(&h->h);
  return 1;
}
int iop_fdhash_add(struct iop_fdhash *h, int fd)
{
  /* sanity */
  if (fd == -1) return 0;

  switch (ht_addb(&h->h, &fd, sizeof(fd), &fd, sizeof(fd))) {
    case 0:
    case -1:
      return 0;
    default:
      return 1;
  }
}
int iop_fdhash_rm(struct iop_fdhash *h, int fd)
{
  /* sanity */
  if (fd == -1) return 0;
  switch (ht_deleteb(&h->h, &fd, sizeof(fd))) {
    case 0:
      return 0;
    default:
      return 1;
  }
}
int iop_fdhash_free(struct iop_fdhash *h)
{
  ht_free(&h->h);
  return 1;
}
