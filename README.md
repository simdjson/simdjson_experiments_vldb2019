# simdjson_experiments_vldb2019

These are detailed experiments done over simdjson.

We use a simple Makefile to execute the docker scripts.

## Layout

The experimental results are in the `result` directory. The code for the experiments is in the `experiments` directory.

There is a distinct directory called `analysis` that contain the scripts processing the resutlts from the `result` directory.

## Requirements

Software:
- Linux 
- Docker (you need privileged access).

Hardware:
- AVX2-compatible processing (Intel, AMD).
- We check that hyperthreading is disabled.


You need to [install docker](https://docs.docker.com/v17.12/install/#supported-platforms), make sure it is running,  and make yourself a priviliged user which may involve `usermod -G -a docker myusername` or some similar command.

## Usage

Typing `make` should help.
