#include "../io_poll.h"
#include <stdio.h>
#include <unistd.h>

#ifndef HAVE_EPOLL
int main()
{
  printf("no epoll on this system\n");
  return 0;
}
#else

#include "t_io_poll.inc"

#endif /* HAVE_EPOLL */
