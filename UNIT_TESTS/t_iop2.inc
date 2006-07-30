#define NUM_PIPES 32

struct io_poll iop;
int pipes[NUM_PIPES][2];

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
  unsigned long ind;

  init();

  if (io_poll_register(&iop) == -1) {
    perror("io_poll_register");
    _exit(1);
  }

  xfree();
  return 0;
}
