nodename:=$(shell uname -n)

all: stacked_plot time_distribution minified_inputs comparison

checkht: 
	./scripts/ht.py	

.PHONY: checkht


comparison: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/comparison/Dockerfile -t comparison .
	$(eval outputdir:=$(PWD)/results/$(nodename)/comparison)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results comparison
	@echo "results have been copied to $(outputdir)"


stacked_plot: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/stacked_plot/Dockerfile -t stacked_plot .
	$(eval outputdir:=$(PWD)/results/$(nodename)/stacked_plot)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results stacked_plot
	@echo "results have been copied to $(outputdir)"



time_distribution: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/time_distribution/Dockerfile -t time_distribution .
	$(eval outputdir:=$(PWD)/results/$(nodename)/time_distribution)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results time_distribution
	@echo "results have been copied to $(outputdir)"

minified_inputs: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/minified_inputs/Dockerfile -t minified_inputs .
	$(eval outputdir:=$(PWD)/results/$(nodename)/minified_inputs)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results minified_inputs
	@echo "results have been copied to $(outputdir)"
