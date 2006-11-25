# auto generated - do not edit

default: all

all: local \
	t_fdhash t_iop1_ep t_iop1_kq t_iop1_po t_iop1_se t_iop2_ep \
	t_iop2_kq t_iop2_po t_iop2_se t_iop3_ep t_iop3_kq t_iop3_po \
	t_iop3_se 

cc: ../cc conf-cc conf-ccfflist ../flags-corelib
	rm -f cc
	ln -s ../cc cc

conf-cc: ../conf-cc
	rm -f conf-cc
	ln -s ../conf-cc conf-cc

conf-ld: ../conf-ld
	rm -f conf-ld
	ln -s ../conf-ld conf-ld

ld: ../ld conf-ld conf-ldfflist ../libs-corelib ../libs-corelib-C
	rm -f ld
	ln -s ../ld ld

t_fdhash:\
	ld t_fdhash.ld t_fdhash.o ../io_poll.a 
	./ld t_fdhash t_fdhash.o ../io_poll.a 
t_fdhash.o:\
	cc t_fdhash.c ../io_poll_fdh.h 
	./cc t_fdhash.c
t_iop1_ep:\
	ld t_iop1_ep.ld t_iop1_ep.o io_poll_ep/io_poll.a 
	./ld t_iop1_ep t_iop1_ep.o io_poll_ep/io_poll.a 
t_iop1_ep.o:\
	cc t_iop1_ep.c ../io_poll.h t_iop1.inc 
	./cc t_iop1_ep.c
t_iop1_kq:\
	ld t_iop1_kq.ld t_iop1_kq.o io_poll_kq/io_poll.a 
	./ld t_iop1_kq t_iop1_kq.o io_poll_kq/io_poll.a 
t_iop1_kq.o:\
	cc t_iop1_kq.c ../io_poll.h t_iop1.inc 
	./cc t_iop1_kq.c
t_iop1_po:\
	ld t_iop1_po.ld t_iop1_po.o io_poll_po/io_poll.a 
	./ld t_iop1_po t_iop1_po.o io_poll_po/io_poll.a 
t_iop1_po.o:\
	cc t_iop1_po.c ../io_poll.h t_iop1.inc 
	./cc t_iop1_po.c
t_iop1_se:\
	ld t_iop1_se.ld t_iop1_se.o io_poll_se/io_poll.a 
	./ld t_iop1_se t_iop1_se.o io_poll_se/io_poll.a 
t_iop1_se.o:\
	cc t_iop1_se.c ../io_poll.h t_iop1.inc 
	./cc t_iop1_se.c
t_iop2_ep:\
	ld t_iop2_ep.ld t_iop2_ep.o io_poll_ep/io_poll.a 
	./ld t_iop2_ep t_iop2_ep.o io_poll_ep/io_poll.a 
t_iop2_ep.o:\
	cc t_iop2_ep.c ../io_poll.h t_iop2.inc 
	./cc t_iop2_ep.c
t_iop2_kq:\
	ld t_iop2_kq.ld t_iop2_kq.o io_poll_kq/io_poll.a 
	./ld t_iop2_kq t_iop2_kq.o io_poll_kq/io_poll.a 
t_iop2_kq.o:\
	cc t_iop2_kq.c ../io_poll.h t_iop2.inc 
	./cc t_iop2_kq.c
t_iop2_po:\
	ld t_iop2_po.ld t_iop2_po.o io_poll_po/io_poll.a 
	./ld t_iop2_po t_iop2_po.o io_poll_po/io_poll.a 
t_iop2_po.o:\
	cc t_iop2_po.c ../io_poll.h t_iop2.inc 
	./cc t_iop2_po.c
t_iop2_se:\
	ld t_iop2_se.ld t_iop2_se.o io_poll_se/io_poll.a 
	./ld t_iop2_se t_iop2_se.o io_poll_se/io_poll.a 
t_iop2_se.o:\
	cc t_iop2_se.c ../io_poll.h t_iop2.inc 
	./cc t_iop2_se.c
t_iop3_ep:\
	ld t_iop3_ep.ld t_iop3_ep.o io_poll_ep/io_poll.a 
	./ld t_iop3_ep t_iop3_ep.o io_poll_ep/io_poll.a 
t_iop3_ep.o:\
	cc t_iop3_ep.c ../io_poll.h t_iop3.inc 
	./cc t_iop3_ep.c
t_iop3_kq:\
	ld t_iop3_kq.ld t_iop3_kq.o io_poll_kq/io_poll.a 
	./ld t_iop3_kq t_iop3_kq.o io_poll_kq/io_poll.a 
t_iop3_kq.o:\
	cc t_iop3_kq.c ../io_poll.h t_iop3.inc 
	./cc t_iop3_kq.c
t_iop3_po:\
	ld t_iop3_po.ld t_iop3_po.o io_poll_po/io_poll.a 
	./ld t_iop3_po t_iop3_po.o io_poll_po/io_poll.a 
t_iop3_po.o:\
	cc t_iop3_po.c ../io_poll.h t_iop3.inc 
	./cc t_iop3_po.c
t_iop3_se:\
	ld t_iop3_se.ld t_iop3_se.o io_poll_se/io_poll.a 
	./ld t_iop3_se t_iop3_se.o io_poll_se/io_poll.a 
t_iop3_se.o:\
	cc t_iop3_se.c ../io_poll.h t_iop3.inc 
	./cc t_iop3_se.c
clean: tests_clean local_clean 
	rm -f cc conf-cc conf-ld ld t_fdhash t_fdhash.o t_iop1_ep \
	t_iop1_ep.o t_iop1_kq t_iop1_kq.o t_iop1_po t_iop1_po.o t_iop1_se \
	t_iop1_se.o t_iop2_ep t_iop2_ep.o t_iop2_kq t_iop2_kq.o t_iop2_po \
	t_iop2_po.o t_iop2_se t_iop2_se.o t_iop3_ep t_iop3_ep.o t_iop3_kq \
	t_iop3_kq.o t_iop3_po t_iop3_po.o t_iop3_se t_iop3_se.o 

tests: make_tests list_tests run_tests
tests_clean:
	rm -f testlist

make_tests: t_fdhash

list_tests:
	./list-tests > testlist

run_tests:
	./run-tests -v

local:
local_clean: io_poll_clean

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
regen:
	cpj-genmk > Makefile.tmp
	mv Makefile.tmp Makefile

