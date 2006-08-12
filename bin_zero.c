#include "bin.h"

void bin_zero(void *bv, unsigned long n)
{
  register char *bc;
  bc = (char *) bv;
  for (;;) {
    if (!n) return; *bc++ = 0; --n;
    if (!n) return; *bc++ = 0; --n;
    if (!n) return; *bc++ = 0; --n;
    if (!n) return; *bc++ = 0; --n;
  }
}
