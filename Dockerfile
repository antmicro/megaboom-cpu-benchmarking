# Chipyard setup

FROM ubuntu:22.04

SHELL [ "/bin/bash", "--login", "-c" ]

RUN apt -qqy update && \
    DEBIAN_FRONTEND=noninteractive apt install -qqy --no-install-recommends \
    autoconf \
    bison \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    flex \
    g++ \
    gcc \
    git \
    help2man \
    kmod \
    pbzip2 \
    python3 \
    sudo \
    wget
RUN update-ca-certificates

COPY scripts/install-conda.sh /install-conda.sh
RUN chmod +x install-conda.sh
RUN ./install-conda.sh
ENV PATH=/root/conda/bin:$PATH
RUN conda init bash

# FIXME: Cleanup the build
# Adding results of build-setup makes the image go from ~0.5GB to over 6GB.
# On public runners, the download speeds are insufficient to transfer such large files.
# RUN . /root/conda/etc/profile.d/conda.sh \
#     && conda activate \
#     && git clone https://github.com/ucb-bar/chipyard.git \
#     && cd chipyard \
#     && git checkout 1.11.0 \
#     &&     ./build-setup.sh riscv-tools -s 3 -s 4 -s 5 -s 6 -s 7 -s 8 -s 9 -s 10 \
#     && cd ..

ENTRYPOINT ["/bin/bash"]

