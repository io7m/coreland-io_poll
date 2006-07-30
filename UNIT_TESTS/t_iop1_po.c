#include "../io_poll.h"
#include <stdio.h>
#include <unistd.h>

#ifndef HAVE_POLL
int main()
{
  printf("no poll on this system\n");
  return 0;
}
#else

#include "t_iop1.inc"

#endif /* HAVE_POLL */
