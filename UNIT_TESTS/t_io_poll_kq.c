#include "../io_poll.h"
#include <stdio.h>
#include <unistd.h>

#ifndef HAVE_KQUEUE
int main()
{
  printf("no kqueue on this system\n");
  return 0;
}
#else

#include "t_io_poll.inc"

#endif /* HAVE_KQUEUE */
