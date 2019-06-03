# simdjson experiments for VLDB Journal

These are detailed experiments done over the simdjson code base for the paper [Parsing gigabytes of JSON per second](https://arxiv.org/abs/1902.08318).

We use a simple Makefile to execute the docker scripts. If you have a proper configured Linux system, you should be able to generate all experimental results with a simple command:

```
make
```


## Layout


The code for the experiments is in the `experiments` directory. Each experiment is in its own repository with a docker file describing the container.

The experimental results are in the `result` directory. They are organized first by node name (to distinguish results from different systems). When you type `make`, it creates a new subdirectory and fills it with experimental results.

There is a distinct directory called `analysis` that contains the scripts processing the resutlts from the `result` directory. The analysis scripts have dependencies: python, pandas, gnuplot.  Doing the analysis is not fully automated, by design: a human being needs to look at the number.

## Requirements

Software:
- Linux 
- Docker (you need privileged access).

Hardware:
- AVX2-compatible processing (Intel, AMD).
- We check that hyperthreading is disabled.

You need to [install docker](https://docs.docker.com/v17.12/install/#supported-platforms), make sure it is running,  and make yourself a priviliged user which may involve `usermod -G -a docker myusername` or some similar command. You want to create a docker group, put yourself in the docker group and restarts docker.
