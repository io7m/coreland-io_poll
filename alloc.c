#include "alloc.h"

extern void *malloc();
extern void free();

/* pointers to default mem functions */
static void *def_alloc(unsigned long);
static void  def_dealloc(void *);
static int   def_realloc(void **, unsigned long, unsigned long);

static alloc_proto allocfunc = def_alloc;
static realloc_proto reallocfunc = def_realloc;
static dealloc_proto deallocfunc = def_dealloc;

static void copy_bytes(const char *sc, char *dc, unsigned long n)
{
  for (;;) {
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
    if (!n) return; *dc++ = *sc++; --n;
  }
}
static void *def_alloc(unsigned long n)
{
  return malloc(n);
}
static void def_dealloc(void *p)
{
  free(p);
}
static int def_realloc(void **p, unsigned long m, unsigned long n)
{
  char *q;
  q = def_alloc(n); /* avoid indirect call */
  if (q == 0) return 0;
  copy_bytes(*p, q, m);
  def_dealloc(*p);
  *p = q;
  return 1;
}

/* interface */

int set_alloc(alloc_proto ap)
{
  if (ap) { allocfunc = ap; } return 0;
}

int set_realloc(realloc_proto rp)
{
  if (rp) { reallocfunc = rp; } return 0;
}

int set_dealloc(dealloc_proto dp)
{
  if (dp) { deallocfunc = dp; } return 0;
}

void* alloc(unsigned long n)
{
  return allocfunc(n);
}

int alloc_re(void **p, unsigned long m, unsigned long n)
{
  return reallocfunc(p, m, n);
}

void dealloc(void *p)
{
  deallocfunc(p);
}
