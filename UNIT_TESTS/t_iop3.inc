int main()
{
  struct io_poll iop;
  unsigned long len;
  long r;
  
  len = 0;

  if (io_poll_init(&iop, len) == -1) {
    perror("io_poll_init");
    exit(2);
  }
  if (iop.len != len) {
    printf("iop.len %lu != %lu\n", iop.len, len);
    exit(1);
  }
  if (iop.a != len + 1 + IO_POLL_OVERALLOC) {
    printf("iop.a %lu != %lu\n", iop.a, len + IO_POLL_OVERALLOC);
    exit(1);
  }

  r = io_poll_wait(&iop, 0);
  if (r != 0) {
    printf("io_poll_wait returned %l\n", r);
    exit(1);
  }

  if (io_poll_free(&iop) == -1) {
    perror("io_poll_init");
    exit(2);
  }

  return 0;
}
