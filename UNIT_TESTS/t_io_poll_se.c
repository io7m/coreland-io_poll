#include "../io_poll.h"
#include <stdio.h>
#include <unistd.h>

#ifndef HAVE_SELECT
int main()
{
  printf("no select on this system\n");
  return 0;
}
#else
int main()
{
  printf("select() backend is currently disabled due to reliabilty concerns\n");
  return 0;
}
#endif /* HAVE_SELECT */
