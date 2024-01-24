#!/bin/bash

# conda activate base

git clone https://github.com/ucb-bar/chipyard.git
cd chipyard
    git checkout 1.11.0
    ./build-setup.sh riscv-tools -s 1 -s 2 -s 3 -s 4 -s 5 -s 6 -s 7 -s 8 -s 9
cd ..
