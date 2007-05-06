#include "install.h"
#include "ctxt.h"

/* generate AFTER build, or generated headers will be missing! */

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "iop_add.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_check.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_core.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_devpoll.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_epoll.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_fdhash.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_free.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_init.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_kqueue.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_misc.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_poll.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_rfds.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_rm.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_select.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_size.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "iop_wait.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "io_poll_fdh.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll_fdh.h", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "io_poll_impl.h", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll.a", "libio_poll.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "io_poll-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "io_poll-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
