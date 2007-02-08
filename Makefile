# auto generated - do not edit

default: all

all: local  sysdeps.out \
	ctxt.a deinstaller depchklist inst-check inst-copy inst-dir \
	inst-link installer instchk io_poll-conf io_poll.a support 

sysdeps: sysdeps.out
sysdeps.out:
	SYSDEPS/sysdep-header sysdeps.out
	(cd SYSDEPS && make)
sysdeps_clean:
	(cd SYSDEPS && make clean)
	rm -f sysdeps.out

cc-compile: conf-cc conf-cctype sysdeps.out flags-corelib 
cc-link: conf-ld sysdeps.out libs-corelib libs-corelib-C 
cc-slib: conf-systype 
conf-cctype:\
	conf-systype conf-cc mk-cctype 
	./mk-cctype > conf-cctype
conf-sosuffix:\
	mk-sosuffix 
	./mk-sosuffix > conf-sosuffix
conf-systype:\
	mk-systype 
	./mk-systype > conf-systype
ctxt.a:\
	cc-slib ctxt.sld ctxt/incdir.o ctxt/dlibdir.o ctxt/slibdir.o \
	ctxt/bindir.o ctxt/version.o 
	./cc-slib ctxt ctxt/incdir.o ctxt/dlibdir.o ctxt/slibdir.o \
	ctxt/bindir.o ctxt/version.o 
ctxt/bindir.c: conf-bindir mk-ctxt
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
	cc-compile ctxt/bindir.c 
	./cc-compile ctxt/bindir.c
ctxt/dlibdir.c: conf-dlibdir mk-ctxt
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
	cc-compile ctxt/dlibdir.c 
	./cc-compile ctxt/dlibdir.c
ctxt/incdir.c: conf-incdir mk-ctxt
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
	cc-compile ctxt/incdir.c 
	./cc-compile ctxt/incdir.c
ctxt/slibdir.c: conf-slibdir mk-ctxt
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
	cc-compile ctxt/slibdir.c 
	./cc-compile ctxt/slibdir.c
ctxt/version.c: VERSION mk-ctxt
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
	cc-compile ctxt/version.c 
	./cc-compile ctxt/version.c
deinstaller:\
	cc-link deinstaller.ld deinstaller.o insthier.o install_core.o \
	install_error.o ctxt.a 
	./cc-link deinstaller deinstaller.o insthier.o install_core.o \
	install_error.o ctxt.a 
deinstaller.o:\
	cc-compile deinstaller.c install.h 
	./cc-compile deinstaller.c
depchklist:\
	cc-link depchklist.ld depchklist.o 
	./cc-link depchklist depchklist.o 
depchklist.o:\
	cc-compile depchklist.c aio-mech.h 
	./cc-compile depchklist.c
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
	cc-link installer.ld installer.o insthier.o install_core.o \
	install_error.o ctxt.a 
	./cc-link installer installer.o insthier.o install_core.o \
	install_error.o ctxt.a 
installer.o:\
	cc-compile installer.c install.h 
	./cc-compile installer.c
instchk:\
	cc-link instchk.ld instchk.o insthier.o install_core.o \
	install_error.o ctxt.a 
	./cc-link instchk instchk.o insthier.o install_core.o \
	install_error.o ctxt.a 
instchk.o:\
	cc-compile instchk.c install.h 
	./cc-compile instchk.c
insthier.o:\
	cc-compile insthier.c ctxt.h install.h 
	./cc-compile insthier.c
io_poll-conf:\
	cc-link io_poll-conf.ld io_poll-conf.o ctxt.a 
	./cc-link io_poll-conf io_poll-conf.o ctxt.a 
io_poll-conf.o:\
	cc-compile io_poll-conf.c ctxt.h 
	./cc-compile io_poll-conf.c
io_poll.a:\
	cc-slib io_poll.sld io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
	./cc-slib io_poll io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
io_poll_add.o:\
	cc-compile io_poll_add.c io_poll.h select.h select.h 
	./cc-compile io_poll_add.c
io_poll_fdh.o:\
	cc-compile io_poll_fdh.c io_poll_fdh.h 
	./cc-compile io_poll_fdh.c
io_poll_flgt.o:\
	cc-compile io_poll_flgt.c io_poll.h select.h 
	./cc-compile io_poll_flgt.c
io_poll_free.o:\
	cc-compile io_poll_free.c io_poll.h select.h 
	./cc-compile io_poll_free.c
io_poll_init.o:\
	cc-compile io_poll_init.c io_poll.h select.h 
	./cc-compile io_poll_init.c
io_poll_iom.o:\
	cc-compile io_poll_iom.c io_poll.h 
	./cc-compile io_poll_iom.c
io_poll_reg.o:\
	cc-compile io_poll_reg.c io_poll.h select.h select.h 
	./cc-compile io_poll_reg.c
io_poll_rm.o:\
	cc-compile io_poll_rm.c io_poll.h select.h select.h 
	./cc-compile io_poll_rm.c
io_poll_wait.o:\
	cc-compile io_poll_wait.c io_poll.h select.h 
	./cc-compile io_poll_wait.c
mk-cctype: conf-cc conf-systype 
mk-ctxt.o:\
	cc-compile mk-ctxt.c
	./cc-compile mk-ctxt.c
mk-ctxt:\
	cc-link mk-ctxt.o mk-ctxt.ld
	./cc-link mk-ctxt mk-ctxt.o
mk-sosuffix: conf-systype 
mk-systype: conf-cc 
support:\
	cc-link support.ld support.o io_poll.a 
	./cc-link support support.o io_poll.a 
support.o:\
	cc-compile support.c aio-mech.h 
	./cc-compile support.c
clean: sysdeps_clean tests_clean local_clean 
	rm -f conf-cctype conf-systype ctxt.a ctxt/bindir.c ctxt/bindir.o \
	ctxt/dlibdir.c ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o \
	ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o \
	deinstaller deinstaller.o depchklist depchklist.o inst-check \
	inst-check.o inst-copy inst-copy.o inst-dir inst-dir.o inst-link \
	inst-link.o install_core.o install_error.o installer installer.o \
	instchk instchk.o insthier.o io_poll-conf io_poll-conf.o io_poll.a \
	io_poll_add.o io_poll_fdh.o io_poll_flgt.o io_poll_free.o \
	io_poll_init.o io_poll_iom.o io_poll_reg.o io_poll_rm.o \
	io_poll_wait.o support support.o 

deinstall: deinstaller
	./deinstaller
deinstall-dryrun: deinstaller
	./deinstaller dryrun
install: installer inst-check inst-copy inst-dir inst-link
	./installer
install-dryrun: installer inst-check inst-copy inst-dir inst-link
	./installer dryrun

install-check: instchk inst-check
	./instchk
tests_clean:
	(cd UNIT_TESTS; make clean)

tests:
	(cd UNIT_TESTS; make && make tests)
local: checkdeps
local_clean: checkdeps_clean

checkdeps: checkdeps.done
checkdeps_clean:
	rm -f checkdeps.done

checkdeps.done: depchklist
	./depchklist
	touch checkdeps.done
regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile

