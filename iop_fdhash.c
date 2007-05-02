#include <corelib/hashtable.h>
#include "io_poll_fdh.h"

int io_poll_fdhash_init(struct io_poll_fdhash *h)
{
  return ht_init(&h->h);
}

int io_poll_fdhash_add(struct io_poll_fdhash *h, int fd)
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

int io_poll_fdhash_rm(struct io_poll_fdhash *h, int fd)
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

int io_poll_fdhash_free(struct io_poll_fdhash *h)
{
  ht_free(&h->h);
  return 1;
}
