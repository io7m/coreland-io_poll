# auto generated - do not edit

default: all

all: local \
	

io_poll.a:\
	mk-slib io_poll.sld io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
	./mk-slib io_poll io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
io_poll_add.o:\
	cc io_poll_add.c 
	./cc io_poll_add.c
io_poll_fdh.o:\
	cc io_poll_fdh.c 
	./cc io_poll_fdh.c
io_poll_flgt.o:\
	cc io_poll_flgt.c 
	./cc io_poll_flgt.c
io_poll_free.o:\
	cc io_poll_free.c 
	./cc io_poll_free.c
io_poll_init.o:\
	cc io_poll_init.c 
	./cc io_poll_init.c
io_poll_iom.o:\
	cc io_poll_iom.c 
	./cc io_poll_iom.c
io_poll_reg.o:\
	cc io_poll_reg.c 
	./cc io_poll_reg.c
io_poll_rm.o:\
	cc io_poll_rm.c 
	./cc io_poll_rm.c
io_poll_wait.o:\
	cc io_poll_wait.c 
	./cc io_poll_wait.c
clean: local_clean 
	rm -f io_poll.a io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 

local: tools sources io_poll.a
local_clean: toollink_clean sources_clean

tools: cc ld mk-slib \
	conf-cc conf-ld rebuild-flag conf-cctype  \
	conf-systype

toollink_clean:
	@rm -f cc ld mk-slib conf-cc conf-ld conf-cctype  \
	conf-systype rebuild-flag

conf-cc: ../../conf-cc
	@echo symlink conf-cc
	@rm -f conf-cc
	@ln -s ../../conf-cc conf-cc
conf-ld: ../../conf-ld
	@echo symlink conf-ld
	@rm -f conf-ld
	@ln -s ../../conf-ld conf-ld
conf-cctype: ../../conf-cctype
	@echo symlink conf-cctype
	@rm -f conf-cctype
	@ln -s ../../conf-cctype conf-cctype
conf-systype: ../../conf-systype
	@echo symlink conf-systype
	@rm -f conf-systype
	@ln -s ../../conf-systype conf-systype

cc: ../../cc conf-cc  conf-ccfflist \
	flags-sysspec
	@echo symlink cc
	@rm -f cc
	@ln -s ../../cc cc

ld: ../../ld conf-ld 
	@echo symlink ld
	@rm -f ld
	@ln -s ../../ld ld

mk-slib: ../../mk-slib 
	@echo symlink mk-slib
	@rm -f mk-slib
	@ln -s ../../mk-slib mk-slib

rebuild-flag:
	@touch rebuild-flag

#--src--#

io_poll_add.c: ../../io_poll_add.c rebuild-flag
	@echo symlink io_poll_add.c
	@rm -f io_poll_add.c
	@ln -s ../../io_poll_add.c io_poll_add.c

io_poll_fdh.c: ../../io_poll_fdh.c rebuild-flag
	@echo symlink io_poll_fdh.c
	@rm -f io_poll_fdh.c
	@ln -s ../../io_poll_fdh.c io_poll_fdh.c

io_poll_flgt.c: ../../io_poll_flgt.c rebuild-flag
	@echo symlink io_poll_flgt.c
	@rm -f io_poll_flgt.c
	@ln -s ../../io_poll_flgt.c io_poll_flgt.c

io_poll_free.c: ../../io_poll_free.c rebuild-flag
	@echo symlink io_poll_free.c
	@rm -f io_poll_free.c
	@ln -s ../../io_poll_free.c io_poll_free.c

io_poll_init.c: ../../io_poll_init.c rebuild-flag
	@echo symlink io_poll_init.c
	@rm -f io_poll_init.c
	@ln -s ../../io_poll_init.c io_poll_init.c

io_poll_iom.c: ../../io_poll_iom.c rebuild-flag
	@echo symlink io_poll_iom.c
	@rm -f io_poll_iom.c
	@ln -s ../../io_poll_iom.c io_poll_iom.c

io_poll_reg.c: ../../io_poll_reg.c rebuild-flag
	@echo symlink io_poll_reg.c
	@rm -f io_poll_reg.c
	@ln -s ../../io_poll_reg.c io_poll_reg.c

io_poll_rm.c: ../../io_poll_rm.c rebuild-flag
	@echo symlink io_poll_rm.c
	@rm -f io_poll_rm.c
	@ln -s ../../io_poll_rm.c io_poll_rm.c

io_poll_wait.c: ../../io_poll_wait.c rebuild-flag
	@echo symlink io_poll_wait.c
	@rm -f io_poll_wait.c
	@ln -s ../../io_poll_wait.c io_poll_wait.c

_aio-mech.h: ../../_aio-mech.h rebuild-flag
	@echo symlink _aio-mech.h
	@rm -f _aio-mech.h
	@ln -s ../../_aio-mech.h _aio-mech.h
_select.h: ../../_select.h rebuild-flag
	@echo symlink _select.h
	@rm -f _select.h
	@ln -s ../../_select.h _select.h
aio-mech.h: ../../aio-mech.h rebuild-flag
	@echo symlink aio-mech.h
	@rm -f aio-mech.h
	@ln -s ../../aio-mech.h aio-mech.h
alloc.h: ../../alloc.h rebuild-flag
	@echo symlink alloc.h
	@rm -f alloc.h
	@ln -s ../../alloc.h alloc.h
bin.h: ../../bin.h rebuild-flag
	@echo symlink bin.h
	@rm -f bin.h
	@ln -s ../../bin.h bin.h
close.h: ../../close.h rebuild-flag
	@echo symlink close.h
	@rm -f close.h
	@ln -s ../../close.h close.h
error.h: ../../error.h rebuild-flag
	@echo symlink error.h
	@rm -f error.h
	@ln -s ../../error.h error.h
io_poll.h: ../../io_poll.h rebuild-flag
	@echo symlink io_poll.h
	@rm -f io_poll.h
	@ln -s ../../io_poll.h io_poll.h
io_poll_fdh.h: ../../io_poll_fdh.h rebuild-flag
	@echo symlink io_poll_fdh.h
	@rm -f io_poll_fdh.h
	@ln -s ../../io_poll_fdh.h io_poll_fdh.h
select.h: ../../select.h rebuild-flag
	@echo symlink select.h
	@rm -f select.h
	@ln -s ../../select.h select.h
sources_clean: 
	rm -f  io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _select.h aio-mech.h alloc.h bin.h close.h error.h io_poll.h io_poll_fdh.h select.h
	touch  io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c
sources:  io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _select.h aio-mech.h alloc.h bin.h close.h error.h io_poll.h io_poll_fdh.h select.h
regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile

