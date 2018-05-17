#!/bin/sh

export DEBIAN_FRONTEND=noninteractive


echo "Upgrading the container"
apt-get update

#install apt-utils first
apt-get -y install apt-utils

#upgrade the container. 
apt-get -y upgrade

#install other dependencies required for building Debian packages

echo "Installing Packages required for building Debian packages"
apt-get -y install git dh-make build-essential autoconf autotools-dev figlet debhelper lintian devscripts live-build live-config

#Clean package files to save space and reduce the size of container. 

echo "removing extra files to save space"
apt-get -y autoremove --purge
apt-get clean
rm -rf /var/lib/apt/lists/*

#create the /incoming directory where we deploy packages. 
echo "creating the incoming folder"
mkdir -p /incoming