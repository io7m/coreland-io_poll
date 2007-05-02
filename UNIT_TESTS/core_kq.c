#include <stdio.h>
#include <stdlib.h>
#include "../io_poll.h"
#include "t_assert.h"

void setcore(struct io_poll *iop)
{
  if (io_poll_core_kqueue)
    test_assert(io_poll_setcore(iop, io_poll_core_kqueue));
  else {
    test_assert(!io_poll_setcore(iop, io_poll_core_kqueue));
    printf("info: kqueue support not present on this platform. exiting.\n");
    exit(0);
  }
}
