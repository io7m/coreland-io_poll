# auto generated - do not edit

default: all

all:\
UNIT_TESTS/core_def.o UNIT_TESTS/core_dp.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/core_kq.o UNIT_TESTS/core_po.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_add1.o UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1_dp \
UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1_po \
UNIT_TESTS/t_add1_se UNIT_TESTS/t_add2.o UNIT_TESTS/t_add2_def \
UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2_kq \
UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2_se UNIT_TESTS/t_add3.o \
UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3_ep \
UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3_se \
UNIT_TESTS/t_add4.o UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4_dp \
UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4_po \
UNIT_TESTS/t_add4_se UNIT_TESTS/t_assert.a UNIT_TESTS/t_assert.o \
UNIT_TESTS/t_core1.o UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1_dp \
UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1_po \
UNIT_TESTS/t_core1_se UNIT_TESTS/t_init1.o UNIT_TESTS/t_init1_def \
UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1_kq \
UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1_se UNIT_TESTS/t_rm1.o \
UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1_dp UNIT_TESTS/t_rm1_ep \
UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1_se \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_verify.o UNIT_TESTS/t_wait1.o \
UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1_ep \
UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1_se \
UNIT_TESTS/t_wait2.o UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2_dp \
UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2_po \
UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait3.o UNIT_TESTS/t_wait3_def \
UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3_kq \
UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait4.o \
UNIT_TESTS/t_wait4_def UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4_ep \
UNIT_TESTS/t_wait4_kq UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4_se \
UNIT_TESTS/t_wait5.o UNIT_TESTS/t_wait5_def UNIT_TESTS/t_wait5_dp \
UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5_kq UNIT_TESTS/t_wait5_po \
UNIT_TESTS/t_wait5_se ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.o ctxt/incdir.o \
ctxt/repos.o ctxt/slibdir.o ctxt/version.o deinstaller deinstaller.o \
install-core.o install-error.o install-posix.o install-win32.o install.a \
installer installer.o instchk instchk.o insthier.o io_poll-conf io_poll-conf.o \
io_poll.a iop_add.o iop_check.o iop_core.o iop_devpoll.o iop_epoll.o \
iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o iop_misc.o iop_poll.o \
iop_rfds.o iop_rm.o iop_select.o iop_size.o iop_wait.o

# Mkf-deinstall
deinstall: deinstaller conf-sosuffix
	./deinstaller
deinstall-dryrun: deinstaller conf-sosuffix
	./deinstaller dryrun

# Mkf-install
install: installer postinstall conf-sosuffix
	./installer
	./postinstall

install-dryrun: installer conf-sosuffix
	./installer dryrun

# Mkf-instchk
install-check: instchk conf-sosuffix
	./instchk

# Mkf-test
tests_clean:
	(cd UNIT_TESTS && make clean)
tests:
	(cd UNIT_TESTS && make tests)

# -- SYSDEPS start
flags-corelib:
	@echo SYSDEPS corelib-flags run create flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./run)
libs-corelib-S:
	@echo SYSDEPS corelib-libs-S run create libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./run)
flags-integer:
	@echo SYSDEPS integer-flags run create flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./run)
libs-integer-S:
	@echo SYSDEPS integer-libs-S run create libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./run)
_io-notice.h:
	@echo SYSDEPS io-notice run create _io-notice.h 
	@(cd SYSDEPS/modules/io-notice && ./run)
_sd_fcntl.h:
	@echo SYSDEPS sd-fcntl run create libs-fcntl flags-fcntl _sd_fcntl.h 
	@(cd SYSDEPS/modules/sd-fcntl && ./run)
flags-fcntl: _sd_fcntl.h
libs-fcntl: _sd_fcntl.h
_sd_select.h:
	@echo SYSDEPS sd-select run create _sd_select.h 
	@(cd SYSDEPS/modules/sd-select && ./run)
_sysinfo.h:
	@echo SYSDEPS sysinfo run create _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./run)


corelib-flags_clean:
	@echo SYSDEPS corelib-flags clean flags-corelib 
	@(cd SYSDEPS/modules/corelib-flags && ./clean)
corelib-libs-S_clean:
	@echo SYSDEPS corelib-libs-S clean libs-corelib-S 
	@(cd SYSDEPS/modules/corelib-libs-S && ./clean)
integer-flags_clean:
	@echo SYSDEPS integer-flags clean flags-integer 
	@(cd SYSDEPS/modules/integer-flags && ./clean)
integer-libs-S_clean:
	@echo SYSDEPS integer-libs-S clean libs-integer-S 
	@(cd SYSDEPS/modules/integer-libs-S && ./clean)
io-notice_clean:
	@echo SYSDEPS io-notice clean _io-notice.h 
	@(cd SYSDEPS/modules/io-notice && ./clean)
sd-fcntl_clean:
	@echo SYSDEPS sd-fcntl clean libs-fcntl flags-fcntl _sd_fcntl.h 
	@(cd SYSDEPS/modules/sd-fcntl && ./clean)
sd-select_clean:
	@echo SYSDEPS sd-select clean _sd_select.h 
	@(cd SYSDEPS/modules/sd-select && ./clean)
sysinfo_clean:
	@echo SYSDEPS sysinfo clean _sysinfo.h 
	@(cd SYSDEPS/modules/sysinfo && ./clean)


sysdeps_clean:\
corelib-flags_clean \
corelib-libs-S_clean \
integer-flags_clean \
integer-libs-S_clean \
io-notice_clean \
sd-fcntl_clean \
sd-select_clean \
sysinfo_clean \


# -- SYSDEPS end


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
	./cc-link UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add1_dp:\
cc-link UNIT_TESTS/t_add1_dp.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add1_dp UNIT_TESTS/t_add1.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add1_ep:\
cc-link UNIT_TESTS/t_add1_ep.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add1_kq:\
cc-link UNIT_TESTS/t_add1_kq.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add1_po:\
cc-link UNIT_TESTS/t_add1_po.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add1_po UNIT_TESTS/t_add1.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add1_se:\
cc-link UNIT_TESTS/t_add1_se.ld UNIT_TESTS/t_add1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add1_se UNIT_TESTS/t_add1.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2.o:\
cc-compile UNIT_TESTS/t_add2.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_add2.c

UNIT_TESTS/t_add2_def:\
cc-link UNIT_TESTS/t_add2_def.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_def UNIT_TESTS/t_add2.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2_dp:\
cc-link UNIT_TESTS/t_add2_dp.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2_ep:\
cc-link UNIT_TESTS/t_add2_ep.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2_kq:\
cc-link UNIT_TESTS/t_add2_kq.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_kq UNIT_TESTS/t_add2.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2_po:\
cc-link UNIT_TESTS/t_add2_po.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add2_se:\
cc-link UNIT_TESTS/t_add2_se.ld UNIT_TESTS/t_add2.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add2_se UNIT_TESTS/t_add2.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3.o:\
cc-compile UNIT_TESTS/t_add3.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_add3.c

UNIT_TESTS/t_add3_def:\
cc-link UNIT_TESTS/t_add3_def.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3_dp:\
cc-link UNIT_TESTS/t_add3_dp.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3_ep:\
cc-link UNIT_TESTS/t_add3_ep.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_ep UNIT_TESTS/t_add3.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3_kq:\
cc-link UNIT_TESTS/t_add3_kq.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3_po:\
cc-link UNIT_TESTS/t_add3_po.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add3_se:\
cc-link UNIT_TESTS/t_add3_se.ld UNIT_TESTS/t_add3.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add3_se UNIT_TESTS/t_add3.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4.o:\
cc-compile UNIT_TESTS/t_add4.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_add4.c

UNIT_TESTS/t_add4_def:\
cc-link UNIT_TESTS/t_add4_def.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4_dp:\
cc-link UNIT_TESTS/t_add4_dp.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_dp UNIT_TESTS/t_add4.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4_ep:\
cc-link UNIT_TESTS/t_add4_ep.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4_kq:\
cc-link UNIT_TESTS/t_add4_kq.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4_po:\
cc-link UNIT_TESTS/t_add4_po.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_po UNIT_TESTS/t_add4.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_add4_se:\
cc-link UNIT_TESTS/t_add4_se.ld UNIT_TESTS/t_add4.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_add4_se UNIT_TESTS/t_add4.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_assert.a:\
cc-slib UNIT_TESTS/t_assert.sld UNIT_TESTS/t_assert.o
	./cc-slib UNIT_TESTS/t_assert UNIT_TESTS/t_assert.o

UNIT_TESTS/t_assert.o:\
cc-compile UNIT_TESTS/t_assert.c UNIT_TESTS/t_assert.h
	./cc-compile UNIT_TESTS/t_assert.c

UNIT_TESTS/t_core.h:\
io_poll.h

UNIT_TESTS/t_core1.o:\
cc-compile UNIT_TESTS/t_core1.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h
	./cc-compile UNIT_TESTS/t_core1.c

UNIT_TESTS/t_core1_def:\
cc-link UNIT_TESTS/t_core1_def.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_core1_dp:\
cc-link UNIT_TESTS/t_core1_dp.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_dp UNIT_TESTS/t_core1.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_core1_ep:\
cc-link UNIT_TESTS/t_core1_ep.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_core1_kq:\
cc-link UNIT_TESTS/t_core1_kq.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_core1_po:\
cc-link UNIT_TESTS/t_core1_po.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_po UNIT_TESTS/t_core1.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_core1_se:\
cc-link UNIT_TESTS/t_core1_se.ld UNIT_TESTS/t_core1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_core1_se UNIT_TESTS/t_core1.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1.o:\
cc-compile UNIT_TESTS/t_init1.c io_poll.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_init1.c

UNIT_TESTS/t_init1_def:\
cc-link UNIT_TESTS/t_init1_def.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_def UNIT_TESTS/t_init1.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1_dp:\
cc-link UNIT_TESTS/t_init1_dp.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1_ep:\
cc-link UNIT_TESTS/t_init1_ep.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1_kq:\
cc-link UNIT_TESTS/t_init1_kq.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_kq UNIT_TESTS/t_init1.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1_po:\
cc-link UNIT_TESTS/t_init1_po.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_init1_se:\
cc-link UNIT_TESTS/t_init1_se.ld UNIT_TESTS/t_init1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_init1_se UNIT_TESTS/t_init1.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1.o:\
cc-compile UNIT_TESTS/t_rm1.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_rm1.c

UNIT_TESTS/t_rm1_def:\
cc-link UNIT_TESTS/t_rm1_def.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1_dp:\
cc-link UNIT_TESTS/t_rm1_dp.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_dp UNIT_TESTS/t_rm1.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1_ep:\
cc-link UNIT_TESTS/t_rm1_ep.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1_kq:\
cc-link UNIT_TESTS/t_rm1_kq.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1_po:\
cc-link UNIT_TESTS/t_rm1_po.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_rm1_se:\
cc-link UNIT_TESTS/t_rm1_se.ld UNIT_TESTS/t_rm1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_rm1_se UNIT_TESTS/t_rm1.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_verify.a:\
cc-slib UNIT_TESTS/t_verify.sld UNIT_TESTS/t_verify.o
	./cc-slib UNIT_TESTS/t_verify UNIT_TESTS/t_verify.o

UNIT_TESTS/t_verify.h:\
io_poll.h

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
	./cc-link UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait1_dp:\
cc-link UNIT_TESTS/t_wait1_dp.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait1_ep:\
cc-link UNIT_TESTS/t_wait1_ep.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait1_ep UNIT_TESTS/t_wait1.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait1_kq:\
cc-link UNIT_TESTS/t_wait1_kq.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait1_po:\
cc-link UNIT_TESTS/t_wait1_po.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait1_se:\
cc-link UNIT_TESTS/t_wait1_se.ld UNIT_TESTS/t_wait1.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait1_se UNIT_TESTS/t_wait1.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2.o:\
cc-compile UNIT_TESTS/t_wait2.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_wait2.c

UNIT_TESTS/t_wait2_def:\
cc-link UNIT_TESTS/t_wait2_def.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2_dp:\
cc-link UNIT_TESTS/t_wait2_dp.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_dp UNIT_TESTS/t_wait2.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2_ep:\
cc-link UNIT_TESTS/t_wait2_ep.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2_kq:\
cc-link UNIT_TESTS/t_wait2_kq.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2_po:\
cc-link UNIT_TESTS/t_wait2_po.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_po UNIT_TESTS/t_wait2.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait2_se:\
cc-link UNIT_TESTS/t_wait2_se.ld UNIT_TESTS/t_wait2.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait2.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3.o:\
cc-compile UNIT_TESTS/t_wait3.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_wait3.c

UNIT_TESTS/t_wait3_def:\
cc-link UNIT_TESTS/t_wait3_def.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_def UNIT_TESTS/t_wait3.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3_dp:\
cc-link UNIT_TESTS/t_wait3_dp.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3_ep:\
cc-link UNIT_TESTS/t_wait3_ep.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3_kq:\
cc-link UNIT_TESTS/t_wait3_kq.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_kq UNIT_TESTS/t_wait3.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3_po:\
cc-link UNIT_TESTS/t_wait3_po.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait3_se:\
cc-link UNIT_TESTS/t_wait3_se.ld UNIT_TESTS/t_wait3.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait3.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4.o:\
cc-compile UNIT_TESTS/t_wait4.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_wait4.c

UNIT_TESTS/t_wait4_def:\
cc-link UNIT_TESTS/t_wait4_def.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_def UNIT_TESTS/t_wait4.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4_dp:\
cc-link UNIT_TESTS/t_wait4_dp.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4_ep:\
cc-link UNIT_TESTS/t_wait4_ep.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_ep UNIT_TESTS/t_wait4.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4_kq:\
cc-link UNIT_TESTS/t_wait4_kq.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_kq UNIT_TESTS/t_wait4.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4_po:\
cc-link UNIT_TESTS/t_wait4_po.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait4_se:\
cc-link UNIT_TESTS/t_wait4_se.ld UNIT_TESTS/t_wait4.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait4_se UNIT_TESTS/t_wait4.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5.o:\
cc-compile UNIT_TESTS/t_wait5.c io_poll.h _sd_fcntl.h UNIT_TESTS/t_core.h \
UNIT_TESTS/t_assert.h UNIT_TESTS/t_verify.h
	./cc-compile UNIT_TESTS/t_wait5.c

UNIT_TESTS/t_wait5_def:\
cc-link UNIT_TESTS/t_wait5_def.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_def.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_def UNIT_TESTS/t_wait5.o UNIT_TESTS/core_def.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5_dp:\
cc-link UNIT_TESTS/t_wait5_dp.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_dp.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_dp UNIT_TESTS/t_wait5.o UNIT_TESTS/core_dp.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5_ep:\
cc-link UNIT_TESTS/t_wait5_ep.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_ep.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5_kq:\
cc-link UNIT_TESTS/t_wait5_kq.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_kq.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_kq UNIT_TESTS/t_wait5.o UNIT_TESTS/core_kq.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5_po:\
cc-link UNIT_TESTS/t_wait5_po.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_po.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_po UNIT_TESTS/t_wait5.o UNIT_TESTS/core_po.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

UNIT_TESTS/t_wait5_se:\
cc-link UNIT_TESTS/t_wait5_se.ld UNIT_TESTS/t_wait5.o UNIT_TESTS/core_se.o \
UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a
	./cc-link UNIT_TESTS/t_wait5_se UNIT_TESTS/t_wait5.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_assert.a io_poll.a

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags conf-ccfflist flags-corelib \
	flags-integer

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldflags conf-ldfflist libs-corelib-S \
	libs-corelib-C libs-integer-S

cc-slib:\
conf-systype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
	ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install.a ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install.a ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

install-core.o:\
cc-compile install-core.c install.h
	./cc-compile install-core.c

install-error.o:\
cc-compile install-error.c install.h
	./cc-compile install-error.c

install-posix.o:\
cc-compile install-posix.c install.h
	./cc-compile install-posix.c

install-win32.o:\
cc-compile install-win32.c install.h
	./cc-compile install-win32.c

install.a:\
cc-slib install.sld install-core.o install-posix.o install-win32.o \
install-error.o
	./cc-slib install install-core.o install-posix.o install-win32.o \
	install-error.o

install.h:\
install_os.h

installer:\
cc-link installer.ld installer.o insthier.o install.a ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install.a ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install.a ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install.a ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

io_poll-conf:\
cc-link io_poll-conf.ld io_poll-conf.o ctxt/ctxt.a
	./cc-link io_poll-conf io_poll-conf.o ctxt/ctxt.a

io_poll-conf.o:\
cc-compile io_poll-conf.c ctxt.h
	./cc-compile io_poll-conf.c

io_poll.a:\
cc-slib io_poll.sld iop_add.o iop_check.o iop_core.o iop_devpoll.o iop_epoll.o \
iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o iop_misc.o iop_poll.o \
iop_rfds.o iop_rm.o iop_select.o iop_size.o iop_wait.o
	./cc-slib io_poll iop_add.o iop_check.o iop_core.o iop_devpoll.o iop_epoll.o \
	iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o iop_misc.o iop_poll.o \
	iop_rfds.o iop_rm.o iop_select.o iop_size.o iop_wait.o

io_poll.h:\
io_poll_fdh.h

io_poll_impl.h:\
_io-notice.h

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

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc conf-ld

clean-all: sysdeps_clean tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/core_def.o UNIT_TESTS/core_dp.o UNIT_TESTS/core_ep.o \
	UNIT_TESTS/core_kq.o UNIT_TESTS/core_po.o UNIT_TESTS/core_se.o \
	UNIT_TESTS/t_add1.o UNIT_TESTS/t_add1_def UNIT_TESTS/t_add1_dp \
	UNIT_TESTS/t_add1_ep UNIT_TESTS/t_add1_kq UNIT_TESTS/t_add1_po \
	UNIT_TESTS/t_add1_se UNIT_TESTS/t_add2.o UNIT_TESTS/t_add2_def \
	UNIT_TESTS/t_add2_dp UNIT_TESTS/t_add2_ep UNIT_TESTS/t_add2_kq \
	UNIT_TESTS/t_add2_po UNIT_TESTS/t_add2_se UNIT_TESTS/t_add3.o \
	UNIT_TESTS/t_add3_def UNIT_TESTS/t_add3_dp UNIT_TESTS/t_add3_ep \
	UNIT_TESTS/t_add3_kq UNIT_TESTS/t_add3_po UNIT_TESTS/t_add3_se \
	UNIT_TESTS/t_add4.o UNIT_TESTS/t_add4_def UNIT_TESTS/t_add4_dp \
	UNIT_TESTS/t_add4_ep UNIT_TESTS/t_add4_kq UNIT_TESTS/t_add4_po \
	UNIT_TESTS/t_add4_se UNIT_TESTS/t_assert.a UNIT_TESTS/t_assert.o \
	UNIT_TESTS/t_core1.o UNIT_TESTS/t_core1_def UNIT_TESTS/t_core1_dp \
	UNIT_TESTS/t_core1_ep UNIT_TESTS/t_core1_kq UNIT_TESTS/t_core1_po \
	UNIT_TESTS/t_core1_se UNIT_TESTS/t_init1.o UNIT_TESTS/t_init1_def \
	UNIT_TESTS/t_init1_dp UNIT_TESTS/t_init1_ep UNIT_TESTS/t_init1_kq \
	UNIT_TESTS/t_init1_po UNIT_TESTS/t_init1_se
	rm -f UNIT_TESTS/t_rm1.o UNIT_TESTS/t_rm1_def UNIT_TESTS/t_rm1_dp \
	UNIT_TESTS/t_rm1_ep UNIT_TESTS/t_rm1_kq UNIT_TESTS/t_rm1_po UNIT_TESTS/t_rm1_se \
	UNIT_TESTS/t_verify.a UNIT_TESTS/t_verify.o UNIT_TESTS/t_wait1.o \
	UNIT_TESTS/t_wait1_def UNIT_TESTS/t_wait1_dp UNIT_TESTS/t_wait1_ep \
	UNIT_TESTS/t_wait1_kq UNIT_TESTS/t_wait1_po UNIT_TESTS/t_wait1_se \
	UNIT_TESTS/t_wait2.o UNIT_TESTS/t_wait2_def UNIT_TESTS/t_wait2_dp \
	UNIT_TESTS/t_wait2_ep UNIT_TESTS/t_wait2_kq UNIT_TESTS/t_wait2_po \
	UNIT_TESTS/t_wait2_se UNIT_TESTS/t_wait3.o UNIT_TESTS/t_wait3_def \
	UNIT_TESTS/t_wait3_dp UNIT_TESTS/t_wait3_ep UNIT_TESTS/t_wait3_kq \
	UNIT_TESTS/t_wait3_po UNIT_TESTS/t_wait3_se UNIT_TESTS/t_wait4.o \
	UNIT_TESTS/t_wait4_def UNIT_TESTS/t_wait4_dp UNIT_TESTS/t_wait4_ep \
	UNIT_TESTS/t_wait4_kq UNIT_TESTS/t_wait4_po UNIT_TESTS/t_wait4_se \
	UNIT_TESTS/t_wait5.o UNIT_TESTS/t_wait5_def UNIT_TESTS/t_wait5_dp \
	UNIT_TESTS/t_wait5_ep UNIT_TESTS/t_wait5_kq UNIT_TESTS/t_wait5_po \
	UNIT_TESTS/t_wait5_se ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.c \
	ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o ctxt/repos.c
	rm -f ctxt/repos.o ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o \
	deinstaller deinstaller.o install-core.o install-error.o install-posix.o \
	install-win32.o install.a installer installer.o instchk instchk.o insthier.o \
	io_poll-conf io_poll-conf.o io_poll.a iop_add.o iop_check.o iop_core.o \
	iop_devpoll.o iop_epoll.o iop_fdhash.o iop_free.o iop_init.o iop_kqueue.o \
	iop_misc.o iop_poll.o iop_rfds.o iop_rm.o iop_select.o iop_size.o iop_wait.o
ext_clean:
	rm -f conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
