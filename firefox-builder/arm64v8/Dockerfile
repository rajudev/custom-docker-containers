FROM arm64v8/debian:testing
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

# Installing dependencies of firefox
RUN apt-get -y install autotools-dev debhelper autoconf2.13 libx11-dev libx11-xcb-dev libxt-dev \
			   libgtk-3-dev libgtk2.0-dev libglib2.0-dev libstartup-notification0-dev libjpeg-dev \
			   zlib1g-dev libbz2-dev libreadline-dev python2.7 python-minimal python-ply dpkg-dev libnspr4-dev \
			   libnss3-dev libsqlite3-dev libvpx-dev libhunspell-dev libdbus-glib-1-dev libffi-dev libevent-dev \
			   libjsoncpp-dev libpulse-dev yasm rustc cargo llvm-4.0-dev libclang-4.0-dev clang-4.0 zip unzip \
			   locales xvfb xfonts-base xauth ttf-bitstream-vera fonts-freefont-ttf fonts-dejima-mincho \
			   fontconfig procps debianutils libsqlite3-0 libnss3
RUN apt-get clean

RUN rm -rf /var/lib/apt/lists/*