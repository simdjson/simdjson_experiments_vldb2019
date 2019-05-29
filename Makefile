tests_over_minified_inputs:
	git submodule update --init --recursive
	docker build  -f experiments/tests_over_minified_inputs/Dockerfile -t tests_over_minified_inputs .
	docker run  tests_over_minified_inputs 
