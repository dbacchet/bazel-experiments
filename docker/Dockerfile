FROM ubuntu:18.04
MAINTAINER Davide

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y gdb
RUN apt-get install -y lcov
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y htop
RUN apt-get install -y unzip
# python
RUN apt-get install -y python
RUN apt-get install -y python-nose
RUN apt-get install -y python3
RUN apt-get install -y python3-nose
# openjdk is needed for bazel coverage
RUN apt-get install -y default-jdk
# bazel
RUN wget https://github.com/bazelbuild/bazel/releases/download/2.2.0/bazel-2.2.0-installer-linux-x86_64.sh \
    && chmod +x bazel-2.2.0-installer-linux-x86_64.sh \
    && ./bazel-2.2.0-installer-linux-x86_64.sh
