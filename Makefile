# auto generated - do not edit

default: all

all: sysdeps.out UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1_dp \
	UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1_po \
	UNIT_TESTS/t_add1_se UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2_dp \
	UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2_po \
	UNIT_TESTS/t_add2_se UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3_dp \
	UNIT_TESTS/t_add3_ep UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3_po \
	UNIT_TESTS/t_add3_se UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4_dp \
	UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4_po \
	UNIT_TESTS/t_add4_se UNIT_TESTS/t_assert.a UNIT_TESTS/t_core1_def \
	UNIT_TESTS/t_core1_dp UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1_kq \
	UNIT_TESTS/t_core1_po UNIT_TESTS/t_core1_se UNIT_TESTS/t_init1_def \
	UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1_kq \
	UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1_se UNIT_TESTS/t_rm1_def \
	UNIT_TESTS/t_rm1_dp UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1_kq \
	UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1_se UNIT_TESTS/t_verify.a \
	UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1_ep \
	UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1_se \
	UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2_dp UNIT_TESTS/t_wait2_ep \
	UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2_po UNIT_TESTS/t_wait2_se \
	io_poll.a 

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
_sd_fcntl.h: sysdeps.out
flags-fcntl: sysdeps.out
libs-fcntl: sysdeps.out
_sd_select.h: sysdeps.out

UNIT_TESTS/core_def.o:\
	cc-compile UNIT_TESTS/core_def.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_def.c
UNIT_TESTS/core_dp.o:\
	cc-compile UNIT_TESTS/core_dp.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_dp.c
UNIT_TESTS/core_ep.o:\
	cc-compile UNIT_TESTS/core_ep.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_ep.c
UNIT_TESTS/core_kq.o:\
	cc-compile UNIT_TESTS/core_kq.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_kq.c
UNIT_TESTS/core_po.o:\
	cc-compile UNIT_TESTS/core_po.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_po.c
UNIT_TESTS/core_se.o:\
	cc-compile UNIT_TESTS/core_se.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_se.c
UNIT_TESTS/t_add1.o:\
	cc-compile UNIT_TESTS/t_add1.c io_poll.h UNIT_TESTS/t_assert.h \
	UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add1.c
UNIT_TESTS/t_add1_def:\
	cc-link UNIT_TESTS/t_add1_def.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add1_dp:\
	cc-link UNIT_TESTS/t_add1_dp.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_dp UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add1_ep:\
	cc-link UNIT_TESTS/t_add1_ep.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add1_kq:\
	cc-link UNIT_TESTS/t_add1_kq.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add1_po:\
	cc-link UNIT_TESTS/t_add1_po.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_po UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add1_se:\
	cc-link UNIT_TESTS/t_add1_se.ld UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add1_se UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2.o:\
	cc-compile UNIT_TESTS/t_add2.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add2.c
UNIT_TESTS/t_add2_def:\
	cc-link UNIT_TESTS/t_add2_def.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2_dp:\
	cc-link UNIT_TESTS/t_add2_dp.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2_ep:\
	cc-link UNIT_TESTS/t_add2_ep.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2_kq:\
	cc-link UNIT_TESTS/t_add2_kq.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2_po:\
	cc-link UNIT_TESTS/t_add2_po.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add2_se:\
	cc-link UNIT_TESTS/t_add2_se.ld UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add2_se UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3.o:\
	cc-compile UNIT_TESTS/t_add3.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add3.c
UNIT_TESTS/t_add3_def:\
	cc-link UNIT_TESTS/t_add3_def.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3_dp:\
	cc-link UNIT_TESTS/t_add3_dp.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3_ep:\
	cc-link UNIT_TESTS/t_add3_ep.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_ep UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3_kq:\
	cc-link UNIT_TESTS/t_add3_kq.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3_po:\
	cc-link UNIT_TESTS/t_add3_po.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add3_se:\
	cc-link UNIT_TESTS/t_add3_se.ld UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add3_se UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4.o:\
	cc-compile UNIT_TESTS/t_add4.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add4.c
UNIT_TESTS/t_add4_def:\
	cc-link UNIT_TESTS/t_add4_def.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4_dp:\
	cc-link UNIT_TESTS/t_add4_dp.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_dp UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4_ep:\
	cc-link UNIT_TESTS/t_add4_ep.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4_kq:\
	cc-link UNIT_TESTS/t_add4_kq.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4_po:\
	cc-link UNIT_TESTS/t_add4_po.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_po UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_add4_se:\
	cc-link UNIT_TESTS/t_add4_se.ld UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_add4_se UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_assert.a:\
	cc-slib UNIT_TESTS/t_assert.sld UNIT_TESTS/t_assert.o 
	./cc-slib UNIT_TESTS/t_assert UNIT_TESTS/t_assert.o 
UNIT_TESTS/t_assert.o:\
	cc-compile UNIT_TESTS/t_assert.c UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/t_assert.c
UNIT_TESTS/t_core1.o:\
	cc-compile UNIT_TESTS/t_core1.c io_poll.h UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/t_core1.c
UNIT_TESTS/t_core1_def:\
	cc-link UNIT_TESTS/t_core1_def.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_core1_dp:\
	cc-link UNIT_TESTS/t_core1_dp.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_dp UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_core1_ep:\
	cc-link UNIT_TESTS/t_core1_ep.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_core1_kq:\
	cc-link UNIT_TESTS/t_core1_kq.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_core1_po:\
	cc-link UNIT_TESTS/t_core1_po.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_po UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_core1_se:\
	cc-link UNIT_TESTS/t_core1_se.ld UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_core1_se UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1.o:\
	cc-compile UNIT_TESTS/t_init1.c io_poll.h UNIT_TESTS/t_assert.h \
	UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_init1.c
UNIT_TESTS/t_init1_def:\
	cc-link UNIT_TESTS/t_init1_def.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_def UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1_dp:\
	cc-link UNIT_TESTS/t_init1_dp.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1_ep:\
	cc-link UNIT_TESTS/t_init1_ep.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1_kq:\
	cc-link UNIT_TESTS/t_init1_kq.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_kq UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1_po:\
	cc-link UNIT_TESTS/t_init1_po.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_init1_se:\
	cc-link UNIT_TESTS/t_init1_se.ld UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_init1_se UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1.o:\
	cc-compile UNIT_TESTS/t_rm1.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_rm1.c
UNIT_TESTS/t_rm1_def:\
	cc-link UNIT_TESTS/t_rm1_def.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1_dp:\
	cc-link UNIT_TESTS/t_rm1_dp.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_dp UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1_ep:\
	cc-link UNIT_TESTS/t_rm1_ep.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1_kq:\
	cc-link UNIT_TESTS/t_rm1_kq.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1_po:\
	cc-link UNIT_TESTS/t_rm1_po.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_rm1_se:\
	cc-link UNIT_TESTS/t_rm1_se.ld UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_se UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_verify.a:\
	cc-slib UNIT_TESTS/t_verify.sld UNIT_TESTS/t_verify.o 
	./cc-slib UNIT_TESTS/t_verify UNIT_TESTS/t_verify.o 
UNIT_TESTS/t_verify.o:\
	cc-compile UNIT_TESTS/t_verify.c UNIT_TESTS/t_assert.h \
	UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_verify.c
UNIT_TESTS/t_wait1.o:\
	cc-compile UNIT_TESTS/t_wait1.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait1.c
UNIT_TESTS/t_wait1_def:\
	cc-link UNIT_TESTS/t_wait1_def.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait1_dp:\
	cc-link UNIT_TESTS/t_wait1_dp.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait1_ep:\
	cc-link UNIT_TESTS/t_wait1_ep.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_ep UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait1_kq:\
	cc-link UNIT_TESTS/t_wait1_kq.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait1_po:\
	cc-link UNIT_TESTS/t_wait1_po.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait1_se:\
	cc-link UNIT_TESTS/t_wait1_se.ld UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_se UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2.o:\
	cc-compile UNIT_TESTS/t_wait2.c io_poll.h _sd_fcntl.h \
	UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait2.c
UNIT_TESTS/t_wait2_def:\
	cc-link UNIT_TESTS/t_wait2_def.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2_dp:\
	cc-link UNIT_TESTS/t_wait2_dp.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_dp UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2_ep:\
	cc-link UNIT_TESTS/t_wait2_ep.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2_kq:\
	cc-link UNIT_TESTS/t_wait2_kq.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2_po:\
	cc-link UNIT_TESTS/t_wait2_po.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_po UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
UNIT_TESTS/t_wait2_se:\
	cc-link UNIT_TESTS/t_wait2_se.ld UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 
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
	cc-slib io_poll.sld iop_add.o iop_check.o iop_core.o iop_devpoll.o \
	iop_epoll.o iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o \
	iop_misc.o iop_poll.o iop_rfds.o iop_rm.o iop_select.o iop_size.o \
	iop_wait.o 
	./cc-slib io_poll iop_add.o iop_check.o iop_core.o iop_devpoll.o \
	iop_epoll.o iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o \
	iop_misc.o iop_poll.o iop_rfds.o iop_rm.o iop_select.o iop_size.o \
	iop_wait.o 
iop_add.o:\
	cc-compile iop_add.c io_poll.h io_poll_impl.h 
	./cc-compile iop_add.c
iop_check.o:\
	cc-compile iop_check.c io_poll.h io_poll_impl.h 
	./cc-compile iop_check.c
iop_core.o:\
	cc-compile iop_core.c io_poll.h io_poll_impl.h 
	./cc-compile iop_core.c
iop_devpoll.o:\
	cc-compile iop_devpoll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_devpoll.c
iop_epoll.o:\
	cc-compile iop_epoll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_epoll.c
iop_fdhash.o:\
	cc-compile iop_fdhash.c io_poll_fdh.h 
	./cc-compile iop_fdhash.c
iop_free.o:\
	cc-compile iop_free.c io_poll.h io_poll_impl.h 
	./cc-compile iop_free.c
iop_init.o:\
	cc-compile iop_init.c io_poll.h io_poll_impl.h 
	./cc-compile iop_init.c
iop_kqueue.o:\
	cc-compile iop_kqueue.c io_poll.h io_poll_impl.h 
	./cc-compile iop_kqueue.c
iop_misc.o:\
	cc-compile iop_misc.c io_poll.h io_poll_impl.h _sd_fcntl.h 
	./cc-compile iop_misc.c
iop_poll.o:\
	cc-compile iop_poll.c io_poll.h io_poll_impl.h 
	./cc-compile iop_poll.c
iop_rfds.o:\
	cc-compile iop_rfds.c io_poll.h io_poll_impl.h 
	./cc-compile iop_rfds.c
iop_rm.o:\
	cc-compile iop_rm.c io_poll.h io_poll_impl.h 
	./cc-compile iop_rm.c
iop_select.o:\
	cc-compile iop_select.c io_poll.h io_poll_impl.h _sd_select.h 
	./cc-compile iop_select.c
iop_size.o:\
	cc-compile iop_size.c io_poll.h 
	./cc-compile iop_size.c
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
clean-all: sysdeps_clean tests_clean obj_clean 
clean: obj_clean
obj_clean: 
	rm -f UNIT_TESTS/core_def.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/core_kq.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_add1.o UNIT_TESTS/t_add1_def \
	UNIT_TESTS/t_add1_dp UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1_kq \
	UNIT_TESTS/t_add1_po UNIT_TESTS/t_add1_se UNIT_TESTS/t_add2.o \
	UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2_ep \
	UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2_se \
	UNIT_TESTS/t_add3.o UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3_dp \
	UNIT_TESTS/t_add3_ep UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3_po \
	UNIT_TESTS/t_add3_se UNIT_TESTS/t_add4.o UNIT_TESTS/t_add4_def \
	UNIT_TESTS/t_add4_dp UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4_kq \
	UNIT_TESTS/t_add4_po UNIT_TESTS/t_add4_se UNIT_TESTS/t_assert.a \
	UNIT_TESTS/t_assert.o UNIT_TESTS/t_core1.o UNIT_TESTS/t_core1_def \
	UNIT_TESTS/t_core1_dp UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1_kq \
	UNIT_TESTS/t_core1_po UNIT_TESTS/t_core1_se UNIT_TESTS/t_init1.o \
	UNIT_TESTS/t_init1_def UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1_ep \
	UNIT_TESTS/t_init1_kq UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1_se \
	UNIT_TESTS/t_rm1.o UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1_dp \
	UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1_po \
	UNIT_TESTS/t_rm1_se UNIT_TESTS/t_verify.a UNIT_TESTS/t_verify.o \
	UNIT_TESTS/t_wait1.o UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1_dp \
	UNIT_TESTS/t_wait1_ep UNIT_TESTS/t_wait1_kq 
	rm -f UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1_se \
	UNIT_TESTS/t_wait2.o UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2_dp \
	UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2_po \
	UNIT_TESTS/t_wait2_se conf-cctype conf-systype io_poll.a iop_add.o \
	iop_check.o iop_core.o iop_devpoll.o iop_epoll.o iop_fdhash.o \
	iop_free.o iop_init.o iop_kqueue.o iop_misc.o iop_poll.o iop_rfds.o \
	iop_rm.o iop_select.o iop_size.o iop_wait.o 

tests_clean:
	(cd UNIT_TESTS && make clean)
tests:
	(cd UNIT_TESTS && make tests)
regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

