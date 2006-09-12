#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_incdir, ctxt_owner, ctxt_group, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, ctxt_owner, ctxt_group, 0755},
  {INST_MKDIR, 0, 0, ctxt_bindir, ctxt_owner, ctxt_group, 0755},
  {INST_COPY, "io_poll.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "_aio-mech.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "_select.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "aio-mech.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "select.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "io_poll_fdh.h", 0, ctxt_incdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "io_poll.a", 0, ctxt_slibdir, ctxt_owner, ctxt_group, 0644},
  {INST_SYMLINK, "io_poll.a", "libio_poll.a", ctxt_slibdir, ctxt_owner, ctxt_group, 0644},
  {INST_COPY, "io_poll-conf", 0, ctxt_bindir, ctxt_owner, ctxt_group, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
