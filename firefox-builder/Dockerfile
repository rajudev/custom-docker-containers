FROM debian:testing
MAINTAINER rajudev

ENV DEBIAN_FRONTEND noninteractive

# Updating the container with the latest packages

RUN echo "Upgrading the container"
RUN apt-get update && apt-get -y upgrade

# Install packages required to build firefox

RUN echo "Installing Packages required for building firefox packages for debian"

#install apt-utils first
RUN apt-get -y install apt-utils

RUN apt-get -y install git dh-make build-essential autoconf autotools-dev figlet debhelper lintian devscripts

