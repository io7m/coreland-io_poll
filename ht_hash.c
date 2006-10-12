#include "hashtable.h"

unsigned long ht_hash(const char *x, unsigned long len)
{
  unsigned long h = 5381;
  unsigned long c;
  while (len) {
    c = *x;
    h = ((h << 5) + h) ^ c;
    --len; ++x;
  }
  return h;
}
