#include <stdio.h>
#include <corelib/get_opt.h>

#include "ctxt.h"

const char progname[] = "io_poll-config";

void usage()
{
  fprintf(stderr, "%s: usage: [-ILhnsV]\n", progname); fflush(0);
}
void help()
{
  fprintf(stderr,
"  -I: print C include location\n"
"  -L: print library location\n"
"  -V: print library version\n"
"  -c: print output as compiler flags, if applicable\n"
"  -s: print output for compiling against static libraries\n"
"  -h: this message\n"
"  -n: print trailing newline\n");
  fflush(0);
}

int main(int argc, char *argv[])
{
  int flag_incdir;
  int flag_libdir;
  int flag_nl;
  int flag_ver;
  int flag_comp;
  int flag_static;
  int ch;
  int ind;

  flag_comp = 0;
  flag_ver = 0;
  flag_nl = 0;
  flag_incdir = 0;
  flag_libdir = 0;
  flag_static = 0;

  if (argc < 1) { usage(); return 111; }

  while ((ch = get_opt(argc, argv, "ILVcshn")) != opteof)
    switch (ch) {
      case 'I': flag_incdir = 1; break;
      case 'L': flag_libdir = 1; break;
      case 'c': flag_comp = 1; break;
      case 'h': usage(); help(); return 0; break;
      case 'n': flag_nl = 1; break;
      case 's': flag_static = 1; break;
      case 'V': flag_ver = 1; break;
       default: usage(); return 111; break;
    }

  if (flag_ver) {
    printf("%s", ctxt_version);
    printf("%s", " ");
  }
  if (flag_incdir) {
    if (flag_comp) printf("%s", "-I");
    printf("%s", ctxt_incdir);
  }
  if (flag_libdir) {
    if (flag_comp) printf("%s", "-L");
    if (flag_static)
      printf("%s", ctxt_slibdir);
    else
      printf("%s", ctxt_slibdir);
    printf("%s", " ");
    if (flag_comp) printf("%s", "-lio_poll ");
  }
  if (flag_nl) { printf("\n"); }
  fflush(0);
  return 0;
}
