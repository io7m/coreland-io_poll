#include "bin.h"

int bin_diff(const void *sv, const void *tv, unsigned long n)
{
  register const char *sc;
  register const char *tc;

  sc = (const char *) sv;
  tc = (const char *) tv; 
  for (;;) {
    if (!n) return 0; if (*sc != *tc) break; ++sc; ++tc; --n;
    if (!n) return 0; if (*sc != *tc) break; ++sc; ++tc; --n;
    if (!n) return 0; if (*sc != *tc) break; ++sc; ++tc; --n;
    if (!n) return 0; if (*sc != *tc) break; ++sc; ++tc; --n;
  }
  return ((int)(unsigned int)(unsigned char) *sc)
       - ((int)(unsigned int)(unsigned char) *tc);
}
