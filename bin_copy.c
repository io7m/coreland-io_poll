#include "bin.h"

void bin_copy(register const void *sv, register void *dv, 
              register unsigned long n)
{
  register const char *sc;
  register char *dc;

  sc = (const char *) sv;
  dc = (char *) dv;

  for (;;) {
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
  }
}
