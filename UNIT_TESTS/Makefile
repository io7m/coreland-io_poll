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

t_fd_hash.o:\
	compile t_fd_hash.c ../fd_hash.h 
	./compile t_fd_hash t_fd_hash.c 
t_iop1_ep.o:\
	compile t_iop1_ep.c ../io_poll.h t_iop1.inc 
	./compile t_iop1_ep t_iop1_ep.c 
t_iop1_kq.o:\
	compile t_iop1_kq.c ../io_poll.h t_iop1.inc 
	./compile t_iop1_kq t_iop1_kq.c 
t_iop1_po.o:\
	compile t_iop1_po.c ../io_poll.h t_iop1.inc 
	./compile t_iop1_po t_iop1_po.c 
t_iop1_se.o:\
	compile t_iop1_se.c ../io_poll.h t_iop1.inc 
	./compile t_iop1_se t_iop1_se.c 
t_iop2_ep.o:\
	compile t_iop2_ep.c ../io_poll.h t_iop2.inc 
	./compile t_iop2_ep t_iop2_ep.c 
t_iop2_kq.o:\
	compile t_iop2_kq.c ../io_poll.h t_iop2.inc 
	./compile t_iop2_kq t_iop2_kq.c 
t_iop2_po.o:\
	compile t_iop2_po.c ../io_poll.h t_iop2.inc 
	./compile t_iop2_po t_iop2_po.c 
t_iop2_se.o:\
	compile t_iop2_se.c ../io_poll.h t_iop2.inc 
	./compile t_iop2_se t_iop2_se.c 

phase_compile:\
	t_fd_hash.o t_iop1_ep.o t_iop1_kq.o t_iop1_po.o t_iop1_se.o \
	t_iop2_ep.o t_iop2_kq.o t_iop2_po.o t_iop2_se.o 
phase_compile_clean:
	rm -f t_fd_hash.o t_iop1_ep.o t_iop1_kq.o t_iop1_po.o t_iop1_se.o \
	t_iop2_ep.o t_iop2_kq.o t_iop2_po.o t_iop2_se.o 

#--LIBRARY--------------------------------------------------------------------


phase_library:
phase_library_clean:

#--LINK-----------------------------------------------------------------------

t_fd_hash:\
	link t_fd_hash.ld t_fd_hash.o ../fd_hash.a ../alloc.a 
	./link t_fd_hash t_fd_hash.o ../fd_hash.a ../alloc.a 
t_iop1_ep:\
	link t_iop1_ep.ld t_iop1_ep.o io_poll_ep/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop1_ep t_iop1_ep.o io_poll_ep/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop1_kq:\
	link t_iop1_kq.ld t_iop1_kq.o io_poll_kq/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop1_kq t_iop1_kq.o io_poll_kq/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop1_po:\
	link t_iop1_po.ld t_iop1_po.o io_poll_po/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop1_po t_iop1_po.o io_poll_po/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop1_se:\
	link t_iop1_se.ld t_iop1_se.o io_poll_se/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop1_se t_iop1_se.o io_poll_se/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop2_ep:\
	link t_iop2_ep.ld t_iop2_ep.o io_poll_ep/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop2_ep t_iop2_ep.o io_poll_ep/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop2_kq:\
	link t_iop2_kq.ld t_iop2_kq.o io_poll_kq/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop2_kq t_iop2_kq.o io_poll_kq/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop2_po:\
	link t_iop2_po.ld t_iop2_po.o io_poll_po/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop2_po t_iop2_po.o io_poll_po/io_poll.a ../bin.a \
	../error.a ../alloc.a 
t_iop2_se:\
	link t_iop2_se.ld t_iop2_se.o io_poll_se/io_poll.a ../bin.a \
	../error.a ../alloc.a 
	./link t_iop2_se t_iop2_se.o io_poll_se/io_poll.a ../bin.a \
	../error.a ../alloc.a 

phase_link:\
	t_fd_hash t_iop1_ep t_iop1_kq t_iop1_po t_iop1_se t_iop2_ep \
	t_iop2_kq t_iop2_po t_iop2_se 
phase_link_clean:
	rm -f t_fd_hash t_iop1_ep t_iop1_kq t_iop1_po t_iop1_se t_iop2_ep \
	t_iop2_kq t_iop2_po t_iop2_se 

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
