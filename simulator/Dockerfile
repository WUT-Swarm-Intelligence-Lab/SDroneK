FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python3-pip \
    python-is-python3 \
    cmake \
    build-essential \
    lsb-release \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] https://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
    && apt-get update \
    && apt-get install -y gz-garden \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install cflib Jinja2

WORKDIR /simulator

RUN git clone https://github.com/gtfactslab/CrazySim.git --recursive \
    && mkdir -p CrazySim/crazyflie-firmware/sitl_make/build \
    && cd CrazySim/crazyflie-firmware/sitl_make/build \
    && cmake .. \
    && make all