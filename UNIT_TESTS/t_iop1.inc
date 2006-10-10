int main()
{
  struct io_poll iop;
  unsigned long len;

  len = 10;

  if (io_poll_init(&iop, len) == -1) {
    perror("io_poll_init");
    _exit(2);
  }
  if (iop.len != len) {
    printf("iop.len %lu != %lu\n", iop.len, len);
    _exit(1);
  }
  if (iop.a != len + 1 + IO_POLL_OVERALLOC) {
    printf("iop.a %lu != %lu\n", iop.a, len + IO_POLL_OVERALLOC);
    _exit(1);
  }
  if (io_poll_free(&iop) == -1) {
    perror("io_poll_init");
    _exit(2);
  }

  return 0;
}
