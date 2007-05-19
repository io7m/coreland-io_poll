#include <stdio.h>
#include <stdlib.h>
#include "../io_poll.h"
#include "t_core.h"
#include "t_assert.h"

void check_core(void)
{
  if (!io_poll_core_kqueue) {
    printf("info: kqueue support not present on this platform. exiting.\n");
    exit(0);
  }
}

void init_core(struct io_poll *iop)
{
  test_assert(io_poll_initcore(iop, io_poll_core_kqueue) == 1);
}

