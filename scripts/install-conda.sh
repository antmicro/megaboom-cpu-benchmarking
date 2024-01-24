#!/bin/bash

set -ex
set -o pipefail

curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh -b -p "${HOME}/conda"

export PATH=/root/conda/bin/:$PATH

conda install -n base conda-libmamba-solver
conda config --set solver libmamba
conda install -n base conda-lock==1.4.0

