#include <stdio.h>
#include <unistd.h>

#define NUM_PIPES 10

int pipes[NUM_PIPES][2];
char buf[128];
unsigned long numfds;
struct io_poll iop;
struct io_pollfd *fds;
struct io_pollfd *rfds;
 
void dump_pipes()
{
  unsigned long ind;
  for (ind = 0; ind < NUM_PIPES; ++ind)
    printf("[%d,%d] ", pipes[ind][0], pipes[ind][1]);

  printf("\n");
}

void init_test()
{
  unsigned long ind;
 
  printf("creating %u pipes\n", NUM_PIPES);

  for (ind = 0; ind < NUM_PIPES; ++ind)
    if (pipe(pipes[ind]) == -1) {
      perror("pipe");
      _exit(2);
    }
  
  dump_pipes();
  printf("initialising %u spaces\n", NUM_PIPES);

  numfds = NUM_PIPES;
  if (io_poll_init(&iop, numfds) == -1) {
    perror("(FAIL: init_test) io_poll_init");
    _exit(1);
  }
  if (iop.len != numfds) {
    printf("(FAIL: init_test) iop.len: %lu != %lu\n", iop.len, numfds);
    _exit(1);
  }
  if (iop.a != numfds + IO_POLL_OVERALLOC) {
    printf("(FAIL: init_test) iop.a: %lu != %lu\n", iop.a,
            numfds + IO_POLL_OVERALLOC);
    _exit(1);
  }

  printf("allocated ok\n");
}

void register_test1()
{
  unsigned long ind;

  /* register all of the pipe read fds */

  printf("registering pipes fds\n");

  fds = iop.fds;
  for (ind = 0; ind < numfds; ++ind) {
    fds[ind].fd = pipes[ind][0];
    fds[ind].events = IO_POLL_READ;
  }

  if (io_poll_register(&iop) == -1) {
    perror("(FAIL: register_test1) io_poll_register"); _exit(1);
  }

  printf("registered ok\n");
}

void wait_test1()
{
  long ret;

  /* check for readability */

  printf("writing to pipes[5][1] (%d), should read on [5][0] (%d)\n",
          pipes[5][1], pipes[5][0]);
  printf("writing to pipes[6][1] (%d), should read on [6][0] (%d)\n",
          pipes[6][1], pipes[6][0]);

  if (write(pipes[5][1], "hello", 6) == -1) { perror("write"); _exit(2); }
  if (write(pipes[6][1], "there", 6) == -1) { perror("write"); _exit(2); }

  printf("polling %lu fds\n", iop.len);

  ret = io_poll_wait(&iop, 0);
  if (ret == -1) { perror("io_poll_wait"); _exit(1); }
  if (ret != 2) {
    printf("(FAIL: wait_test1) io_poll_wait: ret == %lu, expected %u\n", ret, 2);
    _exit(1);
  }

  rfds = iop.rfds;
  if ((rfds[0].fd != pipes[6][0]) &&
      (rfds[1].fd != pipes[6][0])) {
    printf("(FAIL: wait_test1) pipes[6][0] (%d) not in list (%d, %d)\n",
            pipes[6][0], rfds[0].fd, rfds[1].fd);
    _exit(1);
  }
  if ((rfds[0].fd != pipes[5][0]) &&
      (rfds[1].fd != pipes[5][0])) {
    printf("(FAIL: wait_test1) pipes[5][0] (%d) not in list (%d, %d)\n",
            pipes[5][0], rfds[0].fd, rfds[1].fd);
    _exit(1);
  }

  printf("got correct fds\n");
  printf("reading to clear pipes\n");

  /* clear pipes */
  if (read(pipes[5][0], buf, 6) == -1) { perror("read"); _exit(2); }
  if (read(pipes[6][0], buf, 6) == -1) { perror("read"); _exit(2); }

  printf("read ok\n");
}

void wait_test2()
{
  long ret;

  printf("poll file descriptors for nothing\n");

  /* should return 0 */
  ret = io_poll_wait(&iop, 0);
  if (ret == -1) { perror("io_poll_wait"); _exit(1); }
  if (ret != 0) {
    printf("(FAIL: wait_test2) io_poll_wait (1): ret == %lu, expected %u\n",
           ret, 0);
    _exit(1);
  }

  printf("nothing returned\n");
  printf("closing pipes[5][1] (%d)\n", pipes[5][1]);

  /* check what happens for EOF */
  if (close(pipes[5][1]) == -1) { perror("close"); _exit(1); }

  printf("poll file descriptors for EOF\n");

  /* should return 1 */
  ret = io_poll_wait(&iop, 0);
  if (ret == -1) { perror("io_poll_wait"); _exit(1); }
  if (ret != 1) {
    printf("(FAIL: wait_test2) io_poll_wait (2): ret == %lu, expected %u\n",
           ret, 1);
    _exit(1);
  }
  rfds = iop.rfds;

  if (!(rfds[0].events & IO_POLL_EOF)) {
    printf("(WARN: wait_test2) io_poll_wait did not set EOF\n");
    _exit(1);
  }

  printf("EOF test done\n");
}

void rm_test1()
{
  long ret;

  printf("closing pipes[5][0] (%d)\n", pipes[5][0]);

  if (close(pipes[5][0]) == -1) { perror("close"); _exit(1); }

  printf("try to remove invalid file descriptor\n");

  /* should return EBADF */
  ret = io_poll_rm(&iop, 5);
  if (ret != -1) {
    printf("(FAIL: rm_test1) removed a bad file descriptor\n"); _exit(1);
  }

  printf("correctly ignored bad file descriptor\n");
}

void rm_test2()
{
  long ret;
  char ch;

  printf("deleting a file descriptor\n");

  /* stop polling a file descriptor, it should still be open */

  ret = io_poll_rm(&iop, 6);
  if (ret == -1) { perror("(FAIL: rm_test2) io_poll_rm"); _exit(1); }
  if (write(pipes[6][1], &ch, 1) == -1) {
    perror("(FAIL: rm_test2) read"); _exit(2);
  }
  if (read(pipes[6][0], &ch, 1) == -1) {
    perror("(FAIL: rm_test2) read"); _exit(2);
  }
}

void wait_test3()
{
  long ret;
  char ch;

  /* make sure that the file descriptor closed in rm_test2 is not polled */

  if (write(pipes[6][1], &ch, 1) == -1) {
    perror("(FAIL: wait_test3) read"); _exit(2);
  }

  ret = io_poll_wait(&iop, 0);
  if (ret == -1) { perror("(FAIL: wait_test3) io_poll_wait"); _exit(1); }
  if (ret != 0) {
    printf("(FAIL: wait_test3) io_poll_wait returned %lu\n", ret); _exit(1);
  }

  printf("removed file descriptor correctly ignored\n");
}

void free_test()
{
  printf("deallocating io_poll structure\n");

  if (io_poll_free(&iop) == -1) {
    perror("(FAIL: free_test) io_poll_free"); _exit(1);
  }

  printf("deallocated ok\n");
}

static int addpipe1[2];

void add_test1()
{
  long ret;
  unsigned long old_len;
  unsigned long old_a;

  printf("checking if new file descriptors are added correctly\n");

  if (pipe(addpipe1) == -1) { perror("pipe"); _exit(2); }

  old_a = iop.a;
  old_len = iop.len;
  ret = io_poll_add(&iop, addpipe1[0], IO_POLL_READ);
  if (ret == -1) { perror("(FAIL: add_test1) io_poll_add"); _exit(1); }

  if (iop.len != old_len) {
    printf("(FAIL: add_test1) iop.len != old_len: %lu != %lu\n",
           iop.len, old_len);
    _exit(1);
  }
  if (iop.a != old_a) {
    printf("(FAIL: add_test1) iop.a != old_a: %lu != %lu\n",
           iop.a, old_a);
    _exit(1);
  }
  printf("added ok\n");
}

void wait_test4()
{
  char ch;
  long ret;
  
  if (write(addpipe1[1], "", 1) == -1) { perror("write"); _exit(2); }

  printf("checking if added file descriptors are polled\n");

  ret = io_poll_wait(&iop, 0);
  if (ret == -1) { perror("(FAIL: wait_test4) io_poll_wait"); _exit(1); }
  if (ret != 1) {
    printf("(FAIL: wait_test4) io_poll_wait returned %lu\n", ret); _exit(1);
  }

  if (read(addpipe1[0], &ch, 1) == -1) { perror("read"); _exit(2); }
  if (close(addpipe1[0]) == -1) { perror("close"); _exit(2); }
  printf("polled ok\n");
}

static int addpipe2[2];

void add_test2()
{
  unsigned long ind;
  unsigned long old_a;
  unsigned long expect;

  /* check that array reallocation works correctly */
  if (pipe(addpipe2) == -1) { perror("pipe"); _exit(2); }

  printf("attempting to cause reallocation\n");

  if (io_poll_init(&iop, 1) == -1) {
    perror("(FAIL: add_test2) io_poll_init"); _exit(1);
  }
  if (iop.len != 1) {
    printf("(FAIL: add_test2) iop.len: %lu != %d\n", iop.len, 1);
    _exit(1);
  }
  if (iop.a != 1 + IO_POLL_OVERALLOC) {
    printf("(FAIL: add_test2) iop.a: %lu != %lu\n",
           iop.a, (unsigned long) 1 + IO_POLL_OVERALLOC);
    _exit(1);
  }

  old_a = iop.a;
  for (ind = 0; ind < 1 + IO_POLL_OVERALLOC; ++ind) {
    if (io_poll_add(&iop, addpipe2[0], IO_POLL_READ) == -1) {
      perror("(FAIL: add_test2) io_poll_add"); _exit(1);
    }
  }
  if (iop.a == old_a) {
    printf("(FAIL: add_test2) iop.a: %lu == %lu\n", iop.a, old_a);
    _exit(1);
  }
  expect = 1 + IO_POLL_ALLOC + IO_POLL_OVERALLOC + IO_POLL_OVERALLOC;
  if (iop.a != expect) {
    printf("(FAIL: add_test2) iop.a: %lu != %lu\n", iop.a, expect);
    _exit(1);
  }

  printf("reallocated ok\n");
}

void add_test3()
{
  int fd;

  printf("trying to add bad file descriptor\n");
  fd = -1;

  if (io_poll_add(&iop, fd, IO_POLL_READ) != -1) {
    printf("(FAIL: add_test3) added bad file descriptor\n");
    _exit(1);
  }

  printf("failed to add bad file descriptor\n");
}

void register_test2()
{
  printf("attempting to register set with bad file descriptor\n");

  if (io_poll_init(&iop, 1) == -1) {
    perror("(FAIL: register_test2) io_poll_init"); _exit(1);
  }

  iop.fds[0].fd = -1;
  iop.fds[0].events = IO_POLL_READ;
 
  if (io_poll_register(&iop) != -1) {
    printf("(FAIL: register_test2) registered bad file descriptor\n");
    _exit(1);
  }

  printf("failed to register set with bad file descriptor\n");
}

int main()
{
  init_test();
  register_test1();
  wait_test1();
  wait_test2();
  rm_test1();
  rm_test2();
  wait_test3();
  add_test1();
  wait_test4();
  free_test();

  add_test2();
  add_test3();

  free_test();

  register_test2();

  free_test();
  return 0;
}
