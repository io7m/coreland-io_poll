#include "aio-mech.h"
#include <stdio.h>

int main()
{
  int n;

  n = 0;
#ifdef HAVE_KQUEUE
  printf("system has kqueue\n"); ++n;
#endif
#ifdef HAVE_EPOLL
  printf("system has epoll\n"); ++n;
#endif
#ifdef HAVE_POLL
  printf("system has poll\n"); ++n;
#endif
#ifdef HAVE_SELECT
  printf("system has select\n"); ++n;
#endif

  if (!n) {
    printf("Your system does not support any of the IO multiplexing\n"
           "interfaces such as kqueue, epoll, select, poll. This package\n"
           "will not compile on your system.\n");
    return 1;
  }

  return 0;
}
