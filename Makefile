nodename:=$(shell uname -n)

all: minified_inputs

checkht: 
	./scripts/ht.py	

.PHONY: checkht


minified_inputs: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/minified_inputs/Dockerfile -t minified_inputs .
	$(eval outputdir:=$(PWD)/results/$(nodename)/minified_inputs)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results minified_inputs
	@echo "results have been copied to $(outputdir)"
