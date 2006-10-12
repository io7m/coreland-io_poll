#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},

  {INST_COPY, "_aio-mech.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_int16.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_int32.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_int64.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_select.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_uint16.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_uint32.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "_uint64.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "aio-mech.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "alloc.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "bin.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "close.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "ctxt.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "error.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "get_opt.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "hashtable.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "install.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "int64.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "io_poll.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "io_poll_fdh.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "select.h", 0, ctxt_incdir, 0, 0, 0644},

  {INST_COPY, "io_poll.a", 0, ctxt_slibdir, 0, 0, 0644},
  {INST_SYMLINK, "io_poll.a", "libio_poll.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "io_poll-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
