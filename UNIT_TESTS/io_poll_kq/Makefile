# auto generated - do not edit

default: all

all: local io_poll.a 

cc-compile: conf-cc conf-cctype flags-sysspec ../../flags-corelib 
cc-link: conf-ld 
cc-slib: conf-systype 
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
	cc-compile io_poll_add.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_add.c
io_poll_fdh.o:\
	cc-compile io_poll_fdh.c io_poll_fdh.h 
	./cc-compile io_poll_fdh.c
io_poll_flgt.o:\
	cc-compile io_poll_flgt.c io_poll.h io_poll_impl.h 
	./cc-compile io_poll_flgt.c
io_poll_free.o:\
	cc-compile io_poll_free.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_free.c
io_poll_init.o:\
	cc-compile io_poll_init.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_init.c
io_poll_iom.o:\
	cc-compile io_poll_iom.c io_poll.h 
	./cc-compile io_poll_iom.c
io_poll_reg.o:\
	cc-compile io_poll_reg.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_reg.c
io_poll_rm.o:\
	cc-compile io_poll_rm.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_rm.c
io_poll_wait.o:\
	cc-compile io_poll_wait.c io_poll.h io_poll_impl.h sd_select.h 
	./cc-compile io_poll_wait.c
clean-all: local_clean obj_clean 
clean: obj_clean
obj_clean: 
	rm -f io_poll-conf.o io_poll.a io_poll_add.o io_poll_fdh.o \
	io_poll_flgt.o io_poll_free.o io_poll_init.o io_poll_iom.o \
	io_poll_reg.o io_poll_rm.o io_poll_wait.o 

local: tools sources io_poll.a
local_clean: toollink_clean sources_clean

tools: cc-compile cc-link cc-slib \
	conf-cc conf-ld rebuild-flag conf-cctype  \
	conf-systype

toollink_clean:
	@rm -f cc-compile cc-link cc-slib conf-cc conf-ld conf-cctype  \
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

cc-compile: ../../cc-compile conf-cc conf-ccfflist \
	flags-sysspec ../../flags-corelib
	@echo symlink cc-compile
	@rm -f cc-compile
	@ln -s ../../cc-compile cc-compile

cc-link: ../../cc-link conf-ld 
	@echo symlink cc-link
	@rm -f cc-link
	@ln -s ../../cc-link cc-link

cc-slib: ../../cc-slib 
	@echo symlink cc-slib
	@rm -f cc-slib
	@ln -s ../../cc-slib cc-slib

rebuild-flag:
	@touch rebuild-flag

#--src--#

io_poll-conf.c: ../../io_poll-conf.c rebuild-flag
	@echo symlink io_poll-conf.c
	@rm -f io_poll-conf.c
	@ln -s ../../io_poll-conf.c io_poll-conf.c

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
_sd_select.h: ../../_sd_select.h rebuild-flag
	@echo symlink _sd_select.h
	@rm -f _sd_select.h
	@ln -s ../../_sd_select.h _sd_select.h
aio-mech.h: ../../aio-mech.h rebuild-flag
	@echo symlink aio-mech.h
	@rm -f aio-mech.h
	@ln -s ../../aio-mech.h aio-mech.h
ctxt.h: ../../ctxt.h rebuild-flag
	@echo symlink ctxt.h
	@rm -f ctxt.h
	@ln -s ../../ctxt.h ctxt.h
io_poll.h: ../../io_poll.h rebuild-flag
	@echo symlink io_poll.h
	@rm -f io_poll.h
	@ln -s ../../io_poll.h io_poll.h
io_poll_fdh.h: ../../io_poll_fdh.h rebuild-flag
	@echo symlink io_poll_fdh.h
	@rm -f io_poll_fdh.h
	@ln -s ../../io_poll_fdh.h io_poll_fdh.h
io_poll_impl.h: ../../io_poll_impl.h rebuild-flag
	@echo symlink io_poll_impl.h
	@rm -f io_poll_impl.h
	@ln -s ../../io_poll_impl.h io_poll_impl.h
sd_select.h: ../../sd_select.h rebuild-flag
	@echo symlink sd_select.h
	@rm -f sd_select.h
	@ln -s ../../sd_select.h sd_select.h

sources_clean: 
	rm -f  io_poll-conf.c io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _sd_select.h aio-mech.h ctxt.h io_poll.h io_poll_fdh.h
	touch  io_poll-conf.c io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c
sources:  io_poll-conf.c io_poll_add.c io_poll_fdh.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_iom.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _sd_select.h aio-mech.h ctxt.h io_poll.h io_poll_fdh.h
regen:
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile

