# auto generated - do not edit

default: all

all: sysdeps.out io_poll.a 

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
_sd_select.h: sysdeps.out

cc-compile: conf-cc conf-cctype conf-cflags sysdeps.out \
	flags-corelib flags-integer 
cc-link: conf-ld conf-ldflags sysdeps.out libs-corelib \
	libs-corelib-C libs-integer 
cc-slib: conf-systype 
conf-cctype:\
	conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype
conf-systype:\
	mk-systype 
	./mk-systype > conf-systype
io_poll.a:\
	cc-slib io_poll.sld iop_add.o iop_core.o iop_devpoll.o iop_epoll.o \
	iop_free.o iop_init.o iop_kqueue.o iop_poll.o iop_rm.o iop_select.o \
	iop_wait.o 
	./cc-slib io_poll iop_add.o iop_core.o iop_devpoll.o iop_epoll.o \
	iop_free.o iop_init.o iop_kqueue.o iop_poll.o iop_rm.o iop_select.o \
	iop_wait.o 
iop_add.o:\
	cc-compile iop_add.c io_poll.h io_poll_impl.h 
	./cc-compile iop_add.c
iop_core.o:\
	cc-compile iop_core.c io_poll.h io_poll_impl.h 
	./cc-compile iop_core.c
iop_devpoll.o:\
	cc-compile iop_devpoll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_devpoll.c
iop_epoll.o:\
	cc-compile iop_epoll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_epoll.c
iop_free.o:\
	cc-compile iop_free.c io_poll.h io_poll_impl.h 
	./cc-compile iop_free.c
iop_init.o:\
	cc-compile iop_init.c io_poll.h io_poll_impl.h 
	./cc-compile iop_init.c
iop_kqueue.o:\
	cc-compile iop_kqueue.c io_poll.h io_poll_impl.h 
	./cc-compile iop_kqueue.c
iop_poll.o:\
	cc-compile iop_poll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_poll.c
iop_rm.o:\
	cc-compile iop_rm.c io_poll.h io_poll_impl.h 
	./cc-compile iop_rm.c
iop_select.o:\
	cc-compile iop_select.c io_poll.h io_poll_impl.h 
	./cc-compile iop_select.c
iop_wait.o:\
	cc-compile iop_wait.c io_poll.h io_poll_impl.h 
	./cc-compile iop_wait.c
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
	rm -f conf-cctype conf-systype io_poll.a iop_add.o iop_core.o \
	iop_devpoll.o iop_epoll.o iop_free.o iop_init.o iop_kqueue.o \
	iop_poll.o iop_rm.o iop_select.o iop_wait.o 

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

