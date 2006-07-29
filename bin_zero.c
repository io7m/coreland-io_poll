#include "bin.h"

void bin_zero(char *vc, unsigned long n)
{
  for (;;) {
    if (!n) return; *vc++ = 0; --n;
    if (!n) return; *vc++ = 0; --n;
    if (!n) return; *vc++ = 0; --n;
    if (!n) return; *vc++ = 0; --n;
  }
}
