# Base image is ubuntu
FROM ubuntu:latest

# Author: Roy Evangelista
MAINTAINER Roy Evangelista <royevangelista@gmail.com>

# Install git
RUN apt-get -y update &&\
    apt-get -y install git build-essential

# Clone official Go repo
RUN git clone https://go.googlesource.com/go

# Copy go directory to go1.4
RUN cp -r go go1.4

# Build go 1.4
RUN cd go1.4/ &&\
    git checkout release-branch.go1.4 &&\
    cd src/ && ./all.bash; exit 0

# Build go using go 1.4
RUN cd ../../go/src/ && ./all.bash

# Use bash shell as default entrypoint
ENTRYPOINT /bin/bash
