# auto generated - do not edit

default: all

all: local  sysdeps.out \
	alloc.a bin.a ctxt.a deinstaller depchklist error.a get_opt.a \
	hashtable.a inst-check inst-copy inst-dir inst-link installer \
	instchk io_poll-conf io_poll.a support 

sysdeps: sysdeps.out
sysdeps.out:
	SYSDEPS/sysdep-header sysdeps.out
	(cd SYSDEPS && make)
sysdeps_clean:
	(cd SYSDEPS && make clean)
	rm -f sysdeps.out

alloc.a:\
	mk-slib alloc.sld alloc.o 
	./mk-slib alloc alloc.o 
alloc.o:\
	cc alloc.c alloc.h 
	./cc alloc.c
bin.a:\
	mk-slib bin.sld bin_copy.o bin_zero.o bin_diff.o 
	./mk-slib bin bin_copy.o bin_zero.o bin_diff.o 
bin_copy.o:\
	cc bin_copy.c bin.h 
	./cc bin_copy.c
bin_diff.o:\
	cc bin_diff.c bin.h 
	./cc bin_diff.c
bin_zero.o:\
	cc bin_zero.c bin.h 
	./cc bin_zero.c
cc: conf-cc conf-cctype sysdeps.out 
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
	mk-slib ctxt.sld ctxt/incdir.o ctxt/slibdir.o ctxt/bindir.o \
	ctxt/version.o 
	./mk-slib ctxt ctxt/incdir.o ctxt/slibdir.o ctxt/bindir.o \
	ctxt/version.o 
ctxt/bindir.c: conf-bindir mk-ctxt
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
	cc ctxt/bindir.c 
	./cc ctxt/bindir.c
ctxt/incdir.c: conf-incdir mk-ctxt
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
	cc ctxt/incdir.c 
	./cc ctxt/incdir.c
ctxt/slibdir.c: conf-slibdir mk-ctxt
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
	cc ctxt/slibdir.c 
	./cc ctxt/slibdir.c
ctxt/version.c: VERSION mk-ctxt
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
	cc ctxt/version.c 
	./cc ctxt/version.c
deinstaller:\
	ld deinstaller.ld deinstaller.o insthier.o install_core.o \
	install_error.o ctxt.a 
	./ld deinstaller deinstaller.o insthier.o install_core.o \
	install_error.o ctxt.a 
deinstaller.o:\
	cc deinstaller.c install.h 
	./cc deinstaller.c
depchklist:\
	ld depchklist.ld depchklist.o 
	./ld depchklist depchklist.o 
depchklist.o:\
	cc depchklist.c aio-mech.h 
	./cc depchklist.c
error.a:\
	mk-slib error.sld error.o error_str.o 
	./mk-slib error error.o error_str.o 
error.o:\
	cc error.c error.h 
	./cc error.c
error_str.o:\
	cc error_str.c error.h 
	./cc error_str.c
get_opt.a:\
	mk-slib get_opt.sld get_opt.o 
	./mk-slib get_opt get_opt.o 
get_opt.o:\
	cc get_opt.c get_opt.h 
	./cc get_opt.c
hashtable.a:\
	mk-slib hashtable.sld ht_addb.o ht_deleteb.o ht_free.o ht_hash.o \
	ht_init.o 
	./mk-slib hashtable ht_addb.o ht_deleteb.o ht_free.o ht_hash.o \
	ht_init.o 
ht_addb.o:\
	cc ht_addb.c alloc.h bin.h error.h hashtable.h 
	./cc ht_addb.c
ht_deleteb.o:\
	cc ht_deleteb.c alloc.h bin.h hashtable.h 
	./cc ht_deleteb.c
ht_free.o:\
	cc ht_free.c alloc.h hashtable.h 
	./cc ht_free.c
ht_hash.o:\
	cc ht_hash.c hashtable.h 
	./cc ht_hash.c
ht_init.o:\
	cc ht_init.c bin.h hashtable.h 
	./cc ht_init.c
inst-check:\
	ld inst-check.ld inst-check.o install_error.o 
	./ld inst-check inst-check.o install_error.o 
inst-check.o:\
	cc inst-check.c install.h 
	./cc inst-check.c
inst-copy:\
	ld inst-copy.ld inst-copy.o install_error.o 
	./ld inst-copy inst-copy.o install_error.o 
inst-copy.o:\
	cc inst-copy.c install.h 
	./cc inst-copy.c
inst-dir:\
	ld inst-dir.ld inst-dir.o install_error.o 
	./ld inst-dir inst-dir.o install_error.o 
inst-dir.o:\
	cc inst-dir.c install.h 
	./cc inst-dir.c
inst-link:\
	ld inst-link.ld inst-link.o install_error.o 
	./ld inst-link inst-link.o install_error.o 
inst-link.o:\
	cc inst-link.c install.h 
	./cc inst-link.c
install_core.o:\
	cc install_core.c install.h 
	./cc install_core.c
install_error.o:\
	cc install_error.c install.h 
	./cc install_error.c
installer:\
	ld installer.ld installer.o insthier.o install_core.o \
	install_error.o ctxt.a 
	./ld installer installer.o insthier.o install_core.o \
	install_error.o ctxt.a 
installer.o:\
	cc installer.c install.h 
	./cc installer.c
instchk:\
	ld instchk.ld instchk.o insthier.o install_core.o install_error.o \
	ctxt.a 
	./ld instchk instchk.o insthier.o install_core.o install_error.o \
	ctxt.a 
instchk.o:\
	cc instchk.c install.h 
	./cc instchk.c
insthier.o:\
	cc insthier.c ctxt.h install.h 
	./cc insthier.c
io_poll-conf:\
	ld io_poll-conf.ld io_poll-conf.o io_poll.a ctxt.a get_opt.a 
	./ld io_poll-conf io_poll-conf.o io_poll.a ctxt.a get_opt.a 
io_poll-conf.o:\
	cc io_poll-conf.c ctxt.h get_opt.h 
	./cc io_poll-conf.c
io_poll.a:\
	mk-slib io_poll.sld io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
	./mk-slib io_poll io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
io_poll_add.o:\
	cc io_poll_add.c alloc.h bin.h error.h io_poll.h select.h select.h 
	./cc io_poll_add.c
io_poll_fdh.o:\
	cc io_poll_fdh.c alloc.h error.h hashtable.h bin.h io_poll_fdh.h 
	./cc io_poll_fdh.c
io_poll_flgt.o:\
	cc io_poll_flgt.c io_poll.h select.h 
	./cc io_poll_flgt.c
io_poll_free.o:\
	cc io_poll_free.c alloc.h bin.h close.h error.h io_poll.h select.h 
	./cc io_poll_free.c
io_poll_init.o:\
	cc io_poll_init.c alloc.h bin.h close.h error.h io_poll.h select.h 
	./cc io_poll_init.c
io_poll_iom.o:\
	cc io_poll_iom.c io_poll.h 
	./cc io_poll_iom.c
io_poll_reg.o:\
	cc io_poll_reg.c error.h io_poll.h select.h select.h 
	./cc io_poll_reg.c
io_poll_rm.o:\
	cc io_poll_rm.c bin.h error.h io_poll.h select.h select.h 
	./cc io_poll_rm.c
io_poll_wait.o:\
	cc io_poll_wait.c alloc.h bin.h close.h error.h int64.h io_poll.h \
	select.h 
	./cc io_poll_wait.c
ld: conf-ld sysdeps.out 
mk-cctype: conf-cc conf-systype 
mk-ctxt.o:\
	cc mk-ctxt.c
	./cc mk-ctxt.c
mk-ctxt:\
	ld mk-ctxt.o mk-ctxt.ld
	./ld mk-ctxt mk-ctxt.o
mk-slib: conf-systype 
mk-sosuffix: conf-systype 
support:\
	ld support.ld support.o io_poll.a alloc.a bin.a error.a 
	./ld support support.o io_poll.a alloc.a bin.a error.a 
support.o:\
	cc support.c aio-mech.h 
	./cc support.c
clean: sysdeps_clean tests_clean local_clean 
	rm -f alloc.a alloc.o bin.a bin_copy.o bin_diff.o bin_zero.o \
	conf-cctype conf-systype ctxt.a ctxt/bindir.c ctxt/bindir.o \
	ctxt/incdir.c ctxt/incdir.o ctxt/slibdir.c ctxt/slibdir.o \
	ctxt/version.c ctxt/version.o deinstaller deinstaller.o depchklist \
	depchklist.o error.a error.o error_str.o get_opt.a get_opt.o \
	hashtable.a ht_addb.o ht_deleteb.o ht_free.o ht_hash.o ht_init.o \
	inst-check inst-check.o inst-copy inst-copy.o inst-dir inst-dir.o \
	inst-link inst-link.o install_core.o install_error.o installer \
	installer.o instchk instchk.o insthier.o io_poll-conf io_poll-conf.o \
	io_poll.a io_poll_add.o io_poll_fdh.o io_poll_flgt.o io_poll_free.o \
	io_poll_init.o io_poll_iom.o io_poll_reg.o io_poll_rm.o \
	io_poll_wait.o mk-ctxt mk-ctxt.o support support.o 

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

