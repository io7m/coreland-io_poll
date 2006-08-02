#define NUM_PIPES 32

struct io_poll iop;
int pipes[NUM_PIPES][2];

void open_pipes()
{
  unsigned int ind;
  for (ind = 0; ind < NUM_PIPES; ++ind)
    if (pipe(pipes[ind]) == -1) {
      perror("pipe");
      _exit(2);
    }
}
void close_pipes()
{
  unsigned int ind;
  for (ind = 0; ind < NUM_PIPES; ++ind) {
    close(pipes[ind][0]);
    close(pipes[ind][1]);
  }
}
void init()
{
  if (io_poll_init(&iop, NUM_PIPES) == -1) { perror("io_poll_init"); _exit(2); }
}
void xfree()
{
  if (io_poll_free(&iop) == -1) { perror("io_poll_init"); _exit(2); }
}

int main()
{
  unsigned int ind;
  open_pipes();

  init();
  for (ind = 0; ind < NUM_PIPES; ++ind) {
    iop.fds[ind].fd = pipes[ind][0];
    iop.fds[ind].events = IO_POLL_READ;
  }

  if (io_poll_register(&iop) == -1) { perror("io_poll_register"); _exit(1); }
  xfree();

  init();
  for (ind = 0; ind < NUM_PIPES; ++ind) {
    iop.fds[ind].fd = pipes[ind][0];
    iop.fds[ind].events = IO_POLL_READ;
  }

  iop.fds[NUM_PIPES / 2].fd = 0;
  iop.fds[(NUM_PIPES / 2) + 1].fd = 0;

  if (io_poll_register(&iop) != -1) {
    printf("FAIL: io_poll_register did not reject duplicate descriptors\n");
    _exit(1);
  }
  xfree();

  close_pipes();
  return 0;
}
