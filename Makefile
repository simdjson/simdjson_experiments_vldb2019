all: tests_over_minified_inputs

checkht: 
	scripts/ht.py	

.PHONY: checkht


tests_over_minified_inputs: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/tests_over_minified_inputs/Dockerfile -t tests_over_minified_inputs .
	#docker run --privileged tests_over_minified_inputs 
	./experiments/tests_over_minified_inputs/copyout.sh
