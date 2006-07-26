# auto generated - do not edit
# cpj-genmk-0.78

SHELL=/bin/sh
default: all
all: phase_tools_local phase_compile_local phase_compile \
	phase_library_local phase_library phase_link_local phase_link 

tests: phase_test 

clean: phase_local_clean phase_compile_clean phase_library_clean \
	phase_link_clean phase_test_clean 


#--COMPILE--------------------------------------------------------------------

t_io_poll.o:\
	compile t_io_poll.c ../io_poll.h t_io_poll.inc 
	./compile t_io_poll t_io_poll.c 
t_io_poll_ep.o:\
	compile t_io_poll_ep.c ../io_poll.h t_io_poll.inc 
	./compile t_io_poll_ep t_io_poll_ep.c 
t_io_poll_kq.o:\
	compile t_io_poll_kq.c ../io_poll.h t_io_poll.inc 
	./compile t_io_poll_kq t_io_poll_kq.c 
t_io_poll_po.o:\
	compile t_io_poll_po.c ../io_poll.h t_io_poll.inc 
	./compile t_io_poll_po t_io_poll_po.c 
t_io_poll_se.o:\
	compile t_io_poll_se.c ../io_poll.h t_io_poll.inc 
	./compile t_io_poll_se t_io_poll_se.c 

phase_compile:\
	t_io_poll.o t_io_poll_ep.o t_io_poll_kq.o t_io_poll_po.o \
	t_io_poll_se.o 
phase_compile_clean:
	rm -f t_io_poll.o t_io_poll_ep.o t_io_poll_kq.o t_io_poll_po.o \
	t_io_poll_se.o 

#--LIBRARY--------------------------------------------------------------------


phase_library:
phase_library_clean:

#--LINK-----------------------------------------------------------------------

t_io_poll:\
	link t_io_poll.ld t_io_poll.o ../io_poll.a 
	./link t_io_poll t_io_poll.o ../io_poll.a 
t_io_poll_ep:\
	link t_io_poll_ep.ld t_io_poll_ep.o io_poll_ep/io_poll.a 
	./link t_io_poll_ep t_io_poll_ep.o io_poll_ep/io_poll.a 
t_io_poll_kq:\
	link t_io_poll_kq.ld t_io_poll_kq.o io_poll_kq/io_poll.a 
	./link t_io_poll_kq t_io_poll_kq.o io_poll_kq/io_poll.a 
t_io_poll_po:\
	link t_io_poll_po.ld t_io_poll_po.o io_poll_po/io_poll.a 
	./link t_io_poll_po t_io_poll_po.o io_poll_po/io_poll.a 
t_io_poll_se:\
	link t_io_poll_se.ld t_io_poll_se.o io_poll_se/io_poll.a 
	./link t_io_poll_se t_io_poll_se.o io_poll_se/io_poll.a 

phase_link:\
	t_io_poll t_io_poll_ep t_io_poll_kq t_io_poll_po t_io_poll_se 
phase_link_clean:
	rm -f t_io_poll t_io_poll_ep t_io_poll_kq t_io_poll_po t_io_poll_se 

#--TEST-----------------------------------------------------------------------

phase_test: list_tests run_tests
phase_test_clean: tests_clean

tests_clean:
	rm -f testlist

list_tests:
	./list-tests > testlist

run_tests:
	./run-tests -v


#--LOCAL----------------------------------------------------------------------

phase_tools_local: tools
phase_compile_local:
phase_library_local:
phase_link_local:
phase_local_clean: toollink_clean io_poll_clean

toollink_clean:
	rm -f compile link makeso makelib

tools: compile link makeso makelib

compile: ../compile
	ln -s ../compile compile
link: ../link
	ln -s ../link link
makeso: ../makeso
	ln -s ../makeso makeso
makelib: ../makelib
	ln -s ../makelib makelib

#--IO_POLL--#

io_poll_kq/io_poll.a:
	(cd io_poll_kq && make)
io_poll_ep/io_poll.a:
	(cd io_poll_ep && make)
io_poll_po/io_poll.a:
	(cd io_poll_po && make)
io_poll_se/io_poll.a:
	(cd io_poll_se && make)

io_poll_clean:
	(cd io_poll_kq && make clean)
	(cd io_poll_ep && make clean)
	(cd io_poll_po && make clean)
	(cd io_poll_se && make clean)

#--TOOLS----------------------------------------------------------------------

regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile
