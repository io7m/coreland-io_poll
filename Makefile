# auto generated - do not edit

default: all

all:\
sysdeps.out UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1_dp UNIT_TESTS/t_add1_ep \
UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1_po UNIT_TESTS/t_add1_se \
UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2_ep \
UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2_se \
UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3_ep \
UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3_se \
UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4_dp UNIT_TESTS/t_add4_ep \
UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4_po UNIT_TESTS/t_add4_se \
UNIT_TESTS/t_assert.a UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1_dp \
UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1_po \
UNIT_TESTS/t_core1_se UNIT_TESTS/t_init1_def UNIT_TESTS/t_init1_dp \
UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1_kq UNIT_TESTS/t_init1_po \
UNIT_TESTS/t_init1_se UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1_dp \
UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1_po \
UNIT_TESTS/t_rm1_se UNIT_TESTS/t_verify.a UNIT_TESTS/t_wait1_def \
UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1_ep UNIT_TESTS/t_wait1_kq \
UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1_se UNIT_TESTS/t_wait2_def \
UNIT_TESTS/t_wait2_dp UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2_kq \
UNIT_TESTS/t_wait2_po UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait3_def \
UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3_kq \
UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait4_def \
UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4_ep UNIT_TESTS/t_wait4_kq \
UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4_se UNIT_TESTS/t_wait5_def \
UNIT_TESTS/t_wait5_dp UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5_kq \
UNIT_TESTS/t_wait5_po UNIT_TESTS/t_wait5_se ctxt/ctxt.a inst-check inst-copy \
inst-dir inst-link installer instchk io_poll-conf io_poll.a 

sysdeps: sysdeps.out
sysdeps.out:
	SYSDEPS/sysdep-header sysdeps.out
	(cd SYSDEPS && make)
sysdeps_clean:
	(cd SYSDEPS && make clean)
	rm -f sysdeps.out

flags-corelib: sysdeps.out
libs-corelib: sysdeps.out
flags-integer: sysdeps.out
libs-integer: sysdeps.out
_io-notice.h: sysdeps.out
_sd_fcntl.h: sysdeps.out
flags-fcntl: sysdeps.out
libs-fcntl: sysdeps.out
_sd_select.h: sysdeps.out
_sysinfo.h: sysdeps.out

UNIT_TESTS/core_def.o:\
cc-compile UNIT_TESTS/core_def.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_def.c

UNIT_TESTS/core_dp.o:\
cc-compile UNIT_TESTS/core_dp.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_dp.c

UNIT_TESTS/core_ep.o:\
cc-compile UNIT_TESTS/core_ep.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_ep.c

UNIT_TESTS/core_kq.o:\
cc-compile UNIT_TESTS/core_kq.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_kq.c

UNIT_TESTS/core_po.o:\
cc-compile UNIT_TESTS/core_po.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_po.c

UNIT_TESTS/core_se.o:\
cc-compile UNIT_TESTS/core_se.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/core_se.c

UNIT_TESTS/t_add1.o:\
cc-compile UNIT_TESTS/t_add1.c io_poll.h UNIT_TESTS/t_assert.h \
UNIT_TESTS/t_core.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add1.c

UNIT_TESTS/t_add1_def:\
cc-link UNIT_TESTS/t_add1_def.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add1_dp:\
cc-link UNIT_TESTS/t_add1_dp.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_dp UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add1_ep:\
cc-link UNIT_TESTS/t_add1_ep.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add1_kq:\
cc-link UNIT_TESTS/t_add1_kq.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add1_po:\
cc-link UNIT_TESTS/t_add1_po.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_po UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add1_se:\
cc-link UNIT_TESTS/t_add1_se.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add1_se UNIT_TESTS/t_add1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2.o:\
cc-compile UNIT_TESTS/t_add2.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add2.c

UNIT_TESTS/t_add2_def:\
cc-link UNIT_TESTS/t_add2_def.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2_dp:\
cc-link UNIT_TESTS/t_add2_dp.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2_ep:\
cc-link UNIT_TESTS/t_add2_ep.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2_kq:\
cc-link UNIT_TESTS/t_add2_kq.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2_po:\
cc-link UNIT_TESTS/t_add2_po.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add2_se:\
cc-link UNIT_TESTS/t_add2_se.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add2_se UNIT_TESTS/t_add2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3.o:\
cc-compile UNIT_TESTS/t_add3.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add3.c

UNIT_TESTS/t_add3_def:\
cc-link UNIT_TESTS/t_add3_def.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3_dp:\
cc-link UNIT_TESTS/t_add3_dp.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3_ep:\
cc-link UNIT_TESTS/t_add3_ep.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_ep UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3_kq:\
cc-link UNIT_TESTS/t_add3_kq.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3_po:\
cc-link UNIT_TESTS/t_add3_po.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add3_se:\
cc-link UNIT_TESTS/t_add3_se.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add3_se UNIT_TESTS/t_add3.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4.o:\
cc-compile UNIT_TESTS/t_add4.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_add4.c

UNIT_TESTS/t_add4_def:\
cc-link UNIT_TESTS/t_add4_def.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4_dp:\
cc-link UNIT_TESTS/t_add4_dp.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add4_dp UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4_ep:\
cc-link UNIT_TESTS/t_add4_ep.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4_kq:\
cc-link UNIT_TESTS/t_add4_kq.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4_po:\
cc-link UNIT_TESTS/t_add4_po.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_add4_po UNIT_TESTS/t_add4.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_add4_se:\
cc-link UNIT_TESTS/t_add4_se.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
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
cc-compile UNIT_TESTS/t_core1.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h 
	./cc-compile UNIT_TESTS/t_core1.c

UNIT_TESTS/t_core1_def:\
cc-link UNIT_TESTS/t_core1_def.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_core1_dp:\
cc-link UNIT_TESTS/t_core1_dp.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_dp UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_core1_ep:\
cc-link UNIT_TESTS/t_core1_ep.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_core1_kq:\
cc-link UNIT_TESTS/t_core1_kq.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_core1_po:\
cc-link UNIT_TESTS/t_core1_po.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_po UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_core1_se:\
cc-link UNIT_TESTS/t_core1_se.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_core1_se UNIT_TESTS/t_core1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1.o:\
cc-compile UNIT_TESTS/t_init1.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_init1.c

UNIT_TESTS/t_init1_def:\
cc-link UNIT_TESTS/t_init1_def.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_def UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1_dp:\
cc-link UNIT_TESTS/t_init1_dp.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1_ep:\
cc-link UNIT_TESTS/t_init1_ep.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1_kq:\
cc-link UNIT_TESTS/t_init1_kq.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_kq UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1_po:\
cc-link UNIT_TESTS/t_init1_po.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_init1_se:\
cc-link UNIT_TESTS/t_init1_se.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_init1_se UNIT_TESTS/t_init1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1.o:\
cc-compile UNIT_TESTS/t_rm1.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_rm1.c

UNIT_TESTS/t_rm1_def:\
cc-link UNIT_TESTS/t_rm1_def.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1_dp:\
cc-link UNIT_TESTS/t_rm1_dp.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_dp UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1_ep:\
cc-link UNIT_TESTS/t_rm1_ep.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1_kq:\
cc-link UNIT_TESTS/t_rm1_kq.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1_po:\
cc-link UNIT_TESTS/t_rm1_po.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_rm1_se:\
cc-link UNIT_TESTS/t_rm1_se.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_rm1_se UNIT_TESTS/t_rm1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_verify.a:\
cc-slib UNIT_TESTS/t_verify.sld UNIT_TESTS/t_verify.o 
	./cc-slib UNIT_TESTS/t_verify UNIT_TESTS/t_verify.o 

UNIT_TESTS/t_verify.o:\
cc-compile UNIT_TESTS/t_verify.c UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_verify.c

UNIT_TESTS/t_wait1.o:\
cc-compile UNIT_TESTS/t_wait1.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait1.c

UNIT_TESTS/t_wait1_def:\
cc-link UNIT_TESTS/t_wait1_def.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait1_dp:\
cc-link UNIT_TESTS/t_wait1_dp.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait1_ep:\
cc-link UNIT_TESTS/t_wait1_ep.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_ep UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait1_kq:\
cc-link UNIT_TESTS/t_wait1_kq.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait1_po:\
cc-link UNIT_TESTS/t_wait1_po.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait1_se:\
cc-link UNIT_TESTS/t_wait1_se.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait1_se UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2.o:\
cc-compile UNIT_TESTS/t_wait2.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait2.c

UNIT_TESTS/t_wait2_def:\
cc-link UNIT_TESTS/t_wait2_def.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2_dp:\
cc-link UNIT_TESTS/t_wait2_dp.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_dp UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2_ep:\
cc-link UNIT_TESTS/t_wait2_ep.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2_kq:\
cc-link UNIT_TESTS/t_wait2_kq.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2_po:\
cc-link UNIT_TESTS/t_wait2_po.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_po UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait2_se:\
cc-link UNIT_TESTS/t_wait2_se.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait2.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3.o:\
cc-compile UNIT_TESTS/t_wait3.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait3.c

UNIT_TESTS/t_wait3_def:\
cc-link UNIT_TESTS/t_wait3_def.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_def UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3_dp:\
cc-link UNIT_TESTS/t_wait3_dp.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3_ep:\
cc-link UNIT_TESTS/t_wait3_ep.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3_kq:\
cc-link UNIT_TESTS/t_wait3_kq.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_kq UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3_po:\
cc-link UNIT_TESTS/t_wait3_po.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait3_se:\
cc-link UNIT_TESTS/t_wait3_se.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait3.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4.o:\
cc-compile UNIT_TESTS/t_wait4.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait4.c

UNIT_TESTS/t_wait4_def:\
cc-link UNIT_TESTS/t_wait4_def.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_def UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4_dp:\
cc-link UNIT_TESTS/t_wait4_dp.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4_ep:\
cc-link UNIT_TESTS/t_wait4_ep.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_ep UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4_kq:\
cc-link UNIT_TESTS/t_wait4_kq.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_kq UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4_po:\
cc-link UNIT_TESTS/t_wait4_po.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait4_se:\
cc-link UNIT_TESTS/t_wait4_se.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait4_se UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5.o:\
cc-compile UNIT_TESTS/t_wait5.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h 
	./cc-compile UNIT_TESTS/t_wait5.c

UNIT_TESTS/t_wait5_def:\
cc-link UNIT_TESTS/t_wait5_def.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_def UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_def.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5_dp:\
cc-link UNIT_TESTS/t_wait5_dp.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_dp UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_dp.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5_ep:\
cc-link UNIT_TESTS/t_wait5_ep.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_ep.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5_kq:\
cc-link UNIT_TESTS/t_wait5_kq.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_kq UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5_po:\
cc-link UNIT_TESTS/t_wait5_po.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_po UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_po.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

UNIT_TESTS/t_wait5_se:\
cc-link UNIT_TESTS/t_wait5_se.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a 
	./cc-link UNIT_TESTS/t_wait5_se UNIT_TESTS/t_wait5.o \
	UNIT_TESTS/core_se.o UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a \
	io_poll.a 

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags sysdeps.out flags-corelib \
flags-integer 

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldflags sysdeps.out libs-corelib \
libs-corelib-C libs-integer 

cc-slib:\
conf-systype 

conf-cctype:\
conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype

conf-ldtype:\
conf-systype conf-ld conf-cctype mk-ldtype 
	./mk-ldtype > conf-ldtype

conf-sosuffix:\
mk-sosuffix 
	./mk-sosuffix > conf-sosuffix

conf-systype:\
mk-systype 
	./mk-systype > conf-systype

ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c 
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o 
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o \
	ctxt/repos.o ctxt/slibdir.o ctxt/version.o 

ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c 
	./cc-compile ctxt/dlibdir.c

ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c 
	./cc-compile ctxt/incdir.c

ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c 
	./cc-compile ctxt/repos.c

ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c 
	./cc-compile ctxt/slibdir.c

ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c 
	./cc-compile ctxt/version.c

inst-check:\
cc-link inst-check.ld inst-check.o install_error.o 
	./cc-link inst-check inst-check.o install_error.o 

inst-check.o:\
cc-compile inst-check.c install.h 
	./cc-compile inst-check.c

inst-copy:\
cc-link inst-copy.ld inst-copy.o install_error.o 
	./cc-link inst-copy inst-copy.o install_error.o 

inst-copy.o:\
cc-compile inst-copy.c install.h 
	./cc-compile inst-copy.c

inst-dir:\
cc-link inst-dir.ld inst-dir.o install_error.o 
	./cc-link inst-dir inst-dir.o install_error.o 

inst-dir.o:\
cc-compile inst-dir.c install.h 
	./cc-compile inst-dir.c

inst-link:\
cc-link inst-link.ld inst-link.o install_error.o 
	./cc-link inst-link inst-link.o install_error.o 

inst-link.o:\
cc-compile inst-link.c install.h 
	./cc-compile inst-link.c

install_core.o:\
cc-compile install_core.c install.h 
	./cc-compile install_core.c

install_error.o:\
cc-compile install_error.c install.h 
	./cc-compile install_error.c

installer:\
cc-link installer.ld installer.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a 
	./cc-link installer installer.o insthier.o install_core.o \
	install_error.o ctxt/ctxt.a 

installer.o:\
cc-compile installer.c install.h 
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install_core.o install_error.o \
ctxt/ctxt.a 
	./cc-link instchk instchk.o insthier.o install_core.o \
	install_error.o ctxt/ctxt.a 

instchk.o:\
cc-compile instchk.c install.h 
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c install.h ctxt.h 
	./cc-compile insthier.c

io_poll-conf:\
cc-link io_poll-conf.ld io_poll-conf.o ctxt/ctxt.a 
	./cc-link io_poll-conf io_poll-conf.o ctxt/ctxt.a 

io_poll-conf.o:\
cc-compile io_poll-conf.c ctxt.h 
	./cc-compile io_poll-conf.c

io_poll.a:\
cc-slib io_poll.sld iop_add.o iop_check.o iop_core.o iop_devpoll.o \
iop_epoll.o iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o iop_misc.o \
iop_poll.o iop_rfds.o iop_rm.o iop_select.o iop_size.o iop_wait.o 
	./cc-slib io_poll iop_add.o iop_check.o iop_core.o iop_devpoll.o \
	iop_epoll.o iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o \
	iop_misc.o iop_poll.o iop_rfds.o iop_rm.o iop_select.o iop_size.o \
	iop_wait.o 

iop_add.o:\
cc-compile iop_add.c io_poll.h io_poll_impl.h _sd_fcntl.h 
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
cc-compile iop_rm.c io_poll.h io_poll_impl.h _sd_fcntl.h 
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

mk-cctype:\
conf-cc conf-systype 

mk-ctxt.o:\
cc-compile mk-ctxt.c
	./cc-compile mk-ctxt.c

mk-ctxt:\
cc-link mk-ctxt.o mk-ctxt.ld
	./cc-link mk-ctxt mk-ctxt.o

mk-ldtype:\
conf-cctype conf-systype 

mk-sosuffix:\
conf-systype 

mk-systype:\
conf-cc 

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
	UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait3.o UNIT_TESTS/t_wait3_def \
	UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3_kq \
	UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/t_wait4_def UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4_ep \
	UNIT_TESTS/t_wait4_kq UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4_se \
	UNIT_TESTS/t_wait5.o UNIT_TESTS/t_wait5_def UNIT_TESTS/t_wait5_dp \
	UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5_kq UNIT_TESTS/t_wait5_po \
	UNIT_TESTS/t_wait5_se ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a \
	ctxt/dlibdir.c ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o \
	ctxt/repos.c ctxt/repos.o ctxt/slibdir.c ctxt/slibdir.o \
	ctxt/version.c ctxt/version.o inst-check inst-check.o inst-copy \
	inst-copy.o inst-dir inst-dir.o inst-link inst-link.o install_core.o \
	install_error.o installer installer.o instchk instchk.o insthier.o \
	io_poll-conf io_poll-conf.o io_poll.a iop_add.o iop_check.o \
	iop_core.o 
	rm -f iop_devpoll.o iop_epoll.o iop_fdhash.o iop_free.o iop_init.o \
	iop_kqueue.o iop_misc.o iop_poll.o iop_rfds.o iop_rm.o iop_select.o \
	iop_size.o iop_wait.o mk-ctxt mk-ctxt.o 

deinstall: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller
deinstall-dryrun: deinstaller inst-check inst-copy inst-dir inst-link
	./deinstaller dryrun
install: installer inst-check inst-copy inst-dir inst-link postinstall
	./installer
	./postinstall

install-dryrun: installer inst-check inst-copy inst-dir inst-link
	./installer dryrun
install-check: instchk inst-check
	./instchk
tests_clean:
	(cd UNIT_TESTS && make clean)
tests:
	(cd UNIT_TESTS && make tests)
regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

