tests: list_tests run_tests
clean: tests_clean
tests_clean:
	rm -f testlist *.out
list_tests:
	./list-tests > testlist
run_tests:
	./run-tests -v
