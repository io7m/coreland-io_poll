#ifndef ALLOC_H
#define ALLOC_H

/* read ALLOC for details */

typedef void * (*alloc_proto)(unsigned long);
typedef void  (*dealloc_proto)(void *);
typedef int   (*realloc_proto)(void **, unsigned long, unsigned long);
typedef void * vptr;

int set_alloc(alloc_proto);
int set_dealloc(dealloc_proto);
int set_realloc(realloc_proto);

void *alloc(unsigned long);
int   alloc_re(void **, unsigned long, unsigned long);
void  dealloc(void *);

#endif
