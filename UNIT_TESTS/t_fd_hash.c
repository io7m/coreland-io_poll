#include <stdio.h>
#include <unistd.h>

#include "../fd_hash.h"

struct fd_hash fdh;

void add(int fd, int exp)
{
  switch (fd_hash_add(&fdh, fd)) {
    case -1: perror("fd_hash_add: alloc: "); _exit(2);
    case 0:
      if (exp != 0) {
        printf("unexpected duplicate found for %d\n", fd); _exit(1);
      } else {
        printf("found duplicate for %d\n", fd);
        return;
      }
    case 1:
      if (exp != 1) {
        printf("added %d but should have failed\n", exp); _exit(1);
      } else {
        printf("added %d\n", fd);
      }
      break;
    default:
      printf("default case statement reached, should never happen\n");
      _exit(1);
      break;
  }
}

void rm(int fd, int exp)
{
  switch (fd_hash_rm(&fdh, fd)) {
    case 0:
      if (exp != 0) {
        printf("could not remove %d, but should have\n", fd); _exit(1);
      } else {
        printf("did not remove %d\n", fd);
      }
      break;
    case 1:
      if (exp != 1) {
        printf("removed %d, but should not have\n", fd); _exit(1);
      } else {
        printf("removed %d\n", fd);
      }
      break;
    default:
      printf("default case statement reached, should never happen\n");
      _exit(1);
      break;
  }
}

int main()
{
  int i;

  if (fd_hash_init(&fdh) == -1) { perror("fd_hash_init"); _exit(2); }

  add(0, 1);
  add(1, 1);  
  add(1, 0);

  for (i = 2; i < 32; ++i) add(i, 1);
  for (i = 0; i < 32; ++i) add(i, 0);

  rm(0, 1);
  rm(1, 1);
  rm(1, 0);

  for (i = 2; i < 32; ++i) rm(i, 1);
  for (i = 0; i < 32; ++i) rm(i, 0);

  if (fd_hash_free(&fdh) == -1) { perror("fd_hash_free"); _exit(2); }
  return 0;
}
