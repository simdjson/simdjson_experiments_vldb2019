#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
git clone https://github.com/travisdowns/avx-turbo.git
cd avx-turbo
make
