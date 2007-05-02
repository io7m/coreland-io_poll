#ifndef IO_POLL_H
#define IO_POLL_H

#include <corelib/array.h>
#include <integer/int64.h>
#include "io_poll_fdh.h"

#define IO_POLL_READ  0x1
#define IO_POLL_WRITE 0x2
#define IO_POLL_ERROR 0x4
#define IO_POLL_EOF   0x8

struct io_pollfd;
struct io_poll;
struct io_poll_core;

struct io_poll_core {
  int (*init)(struct io_poll *);
  int (*free)(struct io_poll *);
  int (*add)(struct io_poll *, struct io_pollfd *, unsigned long);
  int (*del)(struct io_poll *, int);
  long (*wait)(struct io_poll *, int64);
};

struct io_pollfd {
  int fd;
  unsigned int events;
};

struct io_poll {
  struct io_pfdhash fdhash;
  struct array fds;
  struct array rfds;
  struct array pd_in;
  struct array pd_out;
  const struct io_poll_core *core;
  int pfd;
};

int io_poll_init(struct io_poll *);
int io_poll_add(struct io_poll *, const struct io_pollfd *, unsigned long);
int io_poll_addfd(struct io_poll *, int, unsigned int);
int io_poll_rm(struct io_poll *, const struct io_pollfd *, unsigned long);
int io_poll_rmfd(struct io_poll *, int);
int io_poll_free(struct io_poll *);
long io_poll_wait(struct io_poll *, int64);

unsigned long io_poll_size(const struct io_poll *);

int io_poll_setcore(struct io_poll *, const struct io_poll_core *);
const struct io_poll_core *io_poll_default_core(void);

extern const struct io_poll_core *io_poll_core_devpoll;
extern const struct io_poll_core *io_poll_core_epoll;
extern const struct io_poll_core *io_poll_core_kqueue;
extern const struct io_poll_core *io_poll_core_poll;
extern const struct io_poll_core *io_poll_core_select;

#endif
