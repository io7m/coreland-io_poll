# auto generated - do not edit
# cpj-genmk-0.78

SHELL=/bin/sh
default: all
all: phase_tools_local phase_compile_local phase_compile \
	phase_library_local phase_library phase_link_local phase_link 

clean: phase_local_clean phase_compile_clean phase_library_clean \
	phase_link_clean 


#--COMPILE--------------------------------------------------------------------

io_poll_add.o:\
	compile io_poll_add.c 
	./compile io_poll_add io_poll_add.c 
io_poll_flgt.o:\
	compile io_poll_flgt.c 
	./compile io_poll_flgt io_poll_flgt.c 
io_poll_free.o:\
	compile io_poll_free.c 
	./compile io_poll_free io_poll_free.c 
io_poll_init.o:\
	compile io_poll_init.c 
	./compile io_poll_init io_poll_init.c 
io_poll_reg.o:\
	compile io_poll_reg.c 
	./compile io_poll_reg io_poll_reg.c 
io_poll_rm.o:\
	compile io_poll_rm.c 
	./compile io_poll_rm io_poll_rm.c 
io_poll_wait.o:\
	compile io_poll_wait.c 
	./compile io_poll_wait io_poll_wait.c 

phase_compile:\
	io_poll_add.o io_poll_flgt.o io_poll_free.o io_poll_init.o \
	io_poll_reg.o io_poll_rm.o io_poll_wait.o 
phase_compile_clean:
	rm -f io_poll_add.o io_poll_flgt.o io_poll_free.o io_poll_init.o \
	io_poll_reg.o io_poll_rm.o io_poll_wait.o 

#--LIBRARY--------------------------------------------------------------------

io_poll.a:\
	makelib io_poll.sld io_poll_add.o io_poll_flgt.o io_poll_free.o \
	io_poll_init.o io_poll_reg.o io_poll_rm.o io_poll_wait.o 
	./makelib io_poll io_poll_add.o io_poll_flgt.o io_poll_free.o \
	io_poll_init.o io_poll_reg.o io_poll_rm.o io_poll_wait.o 

phase_library:\
	io_poll.a 
phase_library_clean:
	rm -f io_poll.a 

#--LINK-----------------------------------------------------------------------


phase_link:
phase_link_clean:

#--LOCAL----------------------------------------------------------------------

phase_tools_local: tools sources
phase_compile_local:
phase_library_local:
phase_link_local:
phase_local_clean: toollink_clean sources_clean

tools: make-compile make-link make-makelib make-makeso make-libname \
	conf-cc conf-ld conf-shebang rebuild-flag

toollink_clean:
	@rm -f make-compile make-link make-makelib make-makeso make-libname \
	conf-cc conf-ld conf-shebang rebuild-flag compile link makelib makeso \
	libname 

conf-cc: ../../conf-cc
	@echo symlink conf-cc
	@rm -f conf-cc
	@ln -s ../../conf-cc conf-cc
conf-ld: ../../conf-ld
	@echo symlink conf-ld
	@rm -f conf-ld
	@ln -s ../../conf-ld conf-ld
conf-shebang: ../../conf-shebang
	@echo symlink conf-shebang
	@rm -f conf-shebang
	@ln -s ../../conf-shebang conf-shebang

make-compile: ../../make-compile conf-cc conf-shebang conf-ccfflist \
	flags-sysspec
	@echo symlink make-compile
	@rm -f make-compile
	@ln -s ../../make-compile make-compile

make-link: ../../make-link conf-ld conf-shebang
	@echo symlink make-link
	@rm -f make-link
	@ln -s ../../make-link make-link

make-makelib: ../../make-makelib conf-shebang
	@echo symlink make-makelib
	@rm -f make-makelib
	@ln -s ../../make-makelib make-makelib

make-makeso: ../../make-makeso conf-shebang
	@echo symlink make-makeso
	@rm -f make-makeso
	@ln -s ../../make-makeso make-makeso

make-libname: ../../make-libname conf-shebang
	@echo symlink make-libname
	@rm -f make-libname
	@ln -s ../../make-libname make-libname

compile: conf-shebang conf-cc make-compile conf-ccfflist flags-sysspec
	(cat conf-shebang; ./make-compile) > compile; chmod u+x compile;
link: conf-shebang conf-ld make-link 
	(cat conf-shebang; ./make-link) > link; chmod u+x link;
makelib: conf-shebang make-makelib 
	(cat conf-shebang; ./make-makelib) > makelib; chmod u+x makelib;
makeso: conf-shebang libname make-makeso 
	(cat conf-shebang; ./make-makeso) > makeso; chmod u+x makeso;
libname: conf-shebang make-libname 
	(cat conf-shebang; ./make-libname) > libname; chmod u+x libname;

rebuild-flag:
	@touch rebuild-flag

#--src--#

io_poll_add.c: ../../io_poll_add.c rebuild-flag
	@echo symlink io_poll_add.c
	@rm -f io_poll_add.c
	@ln -s ../../io_poll_add.c io_poll_add.c

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
io_poll.h: ../../io_poll.h rebuild-flag
	@echo symlink io_poll.h
	@rm -f io_poll.h
	@ln -s ../../io_poll.h io_poll.h
select.h: ../../select.h rebuild-flag
	@echo symlink select.h
	@rm -f select.h
	@ln -s ../../select.h select.h
bin.h: ../../bin.h rebuild-flag
	@echo symlink bin.h
	@rm -f bin.h
	@ln -s ../../bin.h bin.h
alloc.h: ../../alloc.h rebuild-flag
	@echo symlink alloc.h
	@rm -f alloc.h
	@ln -s ../../alloc.h alloc.h
error.h: ../../error.h rebuild-flag
	@echo symlink error.h
	@rm -f error.h
	@ln -s ../../error.h error.h
close.h: ../../close.h rebuild-flag
	@echo symlink close.h
	@rm -f close.h
	@ln -s ../../close.h close.h

sources_clean: 
	rm -f  io_poll_add.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _select.h aio-mech.h io_poll.h select.h bin.h alloc.h error.h close.h
	touch  io_poll_add.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_reg.c io_poll_rm.c io_poll_wait.c
sources:  io_poll_add.c io_poll_flgt.c io_poll_free.c io_poll_init.c io_poll_reg.c io_poll_rm.c io_poll_wait.c  _aio-mech.h _select.h aio-mech.h io_poll.h select.h bin.h alloc.h error.h close.h

#--TOOLS----------------------------------------------------------------------

regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile
