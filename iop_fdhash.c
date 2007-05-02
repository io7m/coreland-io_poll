#include <corelib/hashtable.h>
#include "io_poll_fdh.h"

int io_pfdhash_init(struct io_pfdhash *h)
{
  return ht_init(&h->h);
}

int io_pfdhash_add(struct io_pfdhash *h, int fd)
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

int io_pfdhash_rm(struct io_pfdhash *h, int fd)
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

int io_pfdhash_free(struct io_pfdhash *h)
{
  ht_free(&h->h);
  return 1;
}
