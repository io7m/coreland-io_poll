#include "aio-mech.h"
#include <stdio.h>

int main()
{
  printf("compiled with support for: ");
#ifdef HAVE_KQUEUE
  printf("kqueue ");
#endif
#ifdef HAVE_EPOLL
  printf("epoll ");
#endif
#ifdef HAVE_POLL
  printf("poll ");
#endif
#ifdef HAVE_SELECT
  printf("select ");
#endif
  printf("\n");

  return 0;
}
