# auto generated - do not edit
# cpj-genmk-0.78

SHELL=/bin/sh
default: all
all: phase_sysdeps_local phase_sysdeps phase_tools_local phase_tools \
	phase_compile_local phase_compile phase_library_local phase_library \
	phase_link_local phase_link 

tests: phase_test 

clean: phase_local_clean phase_sysdeps_clean phase_tools_clean \
	phase_compile_clean phase_library_clean phase_link_clean \
	phase_test_clean 


#--SYSDEPS--------------------------------------------------------------------

phase_sysdeps: sysdeps
phase_sysdeps_clean: sysdeps_clean

#--TOOLS----------------------------------------------------------------------

phase_tools:  mkftools
phase_tools_clean:  mkftools_clean

#--COMPILE--------------------------------------------------------------------

alloc.o:\
	compile alloc.c alloc.h 
	./compile alloc alloc.c 
bin_copy.o:\
	compile bin_copy.c bin.h 
	./compile bin_copy bin_copy.c 
bin_zero.o:\
	compile bin_zero.c bin.h 
	./compile bin_zero bin_zero.c 
depchklist.o:\
	compile depchklist.c aio-mech.h 
	./compile depchklist depchklist.c 
error.o:\
	compile error.c error.h 
	./compile error error.c 
error_str.o:\
	compile error_str.c error.h 
	./compile error_str error_str.c 
io_poll_add.o:\
	compile io_poll_add.c alloc.h bin.h error.h io_poll.h select.h \
	select.h 
	./compile io_poll_add io_poll_add.c 
io_poll_fdh.o:\
	compile io_poll_fdh.c alloc.h bin.h io_poll_fdh.h 
	./compile io_poll_fdh io_poll_fdh.c 
io_poll_flgt.o:\
	compile io_poll_flgt.c io_poll.h select.h 
	./compile io_poll_flgt io_poll_flgt.c 
io_poll_free.o:\
	compile io_poll_free.c alloc.h bin.h close.h error.h io_poll.h \
	select.h 
	./compile io_poll_free io_poll_free.c 
io_poll_init.o:\
	compile io_poll_init.c alloc.h bin.h close.h error.h io_poll.h \
	select.h 
	./compile io_poll_init io_poll_init.c 
io_poll_iom.o:\
	compile io_poll_iom.c io_poll.h 
	./compile io_poll_iom io_poll_iom.c 
io_poll_reg.o:\
	compile io_poll_reg.c error.h io_poll.h select.h select.h 
	./compile io_poll_reg io_poll_reg.c 
io_poll_rm.o:\
	compile io_poll_rm.c bin.h error.h io_poll.h select.h select.h 
	./compile io_poll_rm io_poll_rm.c 
io_poll_wait.o:\
	compile io_poll_wait.c alloc.h bin.h close.h error.h io_poll.h \
	select.h 
	./compile io_poll_wait io_poll_wait.c 

phase_compile:\
	alloc.o bin_copy.o bin_zero.o depchklist.o error.o error_str.o \
	io_poll_add.o io_poll_fdh.o io_poll_flgt.o io_poll_free.o \
	io_poll_init.o io_poll_iom.o io_poll_reg.o io_poll_rm.o \
	io_poll_wait.o 
phase_compile_clean:
	rm -f alloc.o bin_copy.o bin_zero.o depchklist.o error.o \
	error_str.o io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 

#--LIBRARY--------------------------------------------------------------------

alloc.a:\
	makelib alloc.sld alloc.o 
	./makelib alloc alloc.o 
bin.a:\
	makelib bin.sld bin_copy.o bin_zero.o 
	./makelib bin bin_copy.o bin_zero.o 
error.a:\
	makelib error.sld error.o error_str.o 
	./makelib error error.o error_str.o 
io_poll.a:\
	makelib io_poll.sld io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 
	./makelib io_poll io_poll_add.o io_poll_fdh.o io_poll_flgt.o \
	io_poll_free.o io_poll_init.o io_poll_iom.o io_poll_reg.o \
	io_poll_rm.o io_poll_wait.o 

phase_library:\
	alloc.a bin.a error.a io_poll.a 
phase_library_clean:
	rm -f alloc.a bin.a error.a io_poll.a 

#--LINK-----------------------------------------------------------------------

depchklist:\
	link depchklist.ld depchklist.o 
	./link depchklist depchklist.o 

phase_link:\
	depchklist 
phase_link_clean:
	rm -f depchklist 

#--TEST-----------------------------------------------------------------------

phase_test_clean:
	(cd UNIT_TESTS; make clean)

phase_test:
	(cd UNIT_TESTS; make && make tests)

#--LOCAL----------------------------------------------------------------------

phase_sysdeps_local:
phase_tools_local:
phase_compile_local: checkdeps
phase_library_local:
phase_link_local:
phase_local_clean: checkdeps_clean

checkdeps: checkdeps.done
checkdeps_clean:
	rm -f checkdeps.done

checkdeps.done: depchklist
	./depchklist
	touch checkdeps.done

#--SYSDEPS-TARGET-------------------------------------------------------------

sysdeps: sysdeps.out
sysdeps_clean: sysdep_clean
sysdeps.out:
	SYSDEPS/sysdep-header sysdeps.out
	(cd SYSDEPS && make )
sysdep_clean:
	(cd SYSDEPS && make clean)
	rm -f sysdeps.out

#--TOOLS----------------------------------------------------------------------

mkftools: compile makelib libname makeso link 
compile: sysdeps.out conf-shebang conf-cc make-compile 
	(cat conf-shebang; ./make-compile) > compile; chmod u+x compile;
link: sysdeps.out conf-shebang conf-ld make-link 
	(cat conf-shebang; ./make-link) > link; chmod u+x link;
makelib: sysdeps.out conf-shebang make-makelib 
	(cat conf-shebang; ./make-makelib) > makelib; chmod u+x makelib;
makeso: sysdeps.out conf-shebang libname make-makeso 
	(cat conf-shebang; ./make-makeso) > makeso; chmod u+x makeso;
libname: sysdeps.out conf-shebang make-libname 
	(cat conf-shebang; ./make-libname) > libname; chmod u+x libname;
mkftools_clean: 
	 rm -f compile makelib makeso libname link 
regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile
