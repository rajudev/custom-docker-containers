#!/bin/sh

# change to our own mirror
echo "deb http://deb.debian.org/debian/ testing main non-free contrib" > /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian/ testing main non-free contrib" >> /etc/apt/sources.list  

# requirements

echo "Upgrading the container"
apt-get update
apt-get -y upgrade

echo "Installing Packages required for building Debian packages"

#install apt-utils first
apt-get -y install apt-utils

#install other dependencies required for building Debian packages
apt-get -y install git dh-make build-essential autoconf autotools-dev figlet debhelper lintian devscripts