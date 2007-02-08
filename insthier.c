#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},

  {INST_COPY, "_aio-mech.h", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "_sd_select.h", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "aio-mech.h", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "io_poll.h", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "io_poll_fdh.h", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "select.h", 0, ctxt_incdir, 0, 0, 0444},

  {INST_COPY, "io_poll.a", "libio_poll.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "io_poll-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
