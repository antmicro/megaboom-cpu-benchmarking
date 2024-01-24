# megaboom-cpu-benchmarking

Copyright (c) 2024 [Antmicro](https://antmicro.com)

# Docker image

Current version of the docker image only installs and prepares conda without installing Chipyard. Check comment in Dockerfile for more details.

If you want to recreate the docker image you have to trigger the ci_docker workflow manually.

# Verilator tests

This workflow runs the verilator tests from Chipyard:

    CONFIG: ["RocketConfig", "MegaBoomConfig"]
    BINARY: ["../../tests/hello.riscv", "../../software/coremark/riscv-coremark/coremark.bare.riscv"]

with Verilator:

    pushd sims/verilator
        make run-binary CONFIG=${CONFIG} BINARY=${BINARY}
    popd

