# auto generated - do not edit

default: all

all: sysdeps.out 

sysdeps: sysdeps.out
sysdeps.out:
	SYSDEPS/sysdep-header sysdeps.out
	(cd SYSDEPS && make)
sysdeps_clean:
	(cd SYSDEPS && make clean)
	rm -f sysdeps.out

_aio-mech.h: sysdeps.out
flags-corelib: sysdeps.out
libs-corelib: sysdeps.out
flags-integer: sysdeps.out
libs-integer: sysdeps.out

cc-compile: conf-cc conf-cctype sysdeps.out 
cc-link: conf-ld sysdeps.out 
cc-slib: conf-systype 
conf-cctype:\
	conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype
conf-systype:\
	mk-systype 
	./mk-systype > conf-systype
mk-cctype: conf-cc conf-systype 
mk-ctxt.o:\
	cc-compile mk-ctxt.c
	./cc-compile mk-ctxt.c
mk-ctxt:\
	cc-link mk-ctxt.o mk-ctxt.ld
	./cc-link mk-ctxt mk-ctxt.o
mk-systype: conf-cc 
clean-all: sysdeps_clean obj_clean 
clean: obj_clean
obj_clean: 
	rm -f 

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

