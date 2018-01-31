#!/bin/sh

#  Update container 
apt-get update
apt-get -y upgrade

# Installing some required  packages

apt-get -y install apt-utils wget curl build-essential

# Add repos of Kurento 

#wget http://ubuntu.kurento.org/kurento.gpg.key -O - | apt-key add -  # add kurento key

echo "deb [trusted=yes] http://ubuntu.kurento.org xenial-dev kms6" | tee /etc/apt/sources.list.d/kurento.list # add kurento repos


# Install kurento

echo "Installing Kurento"
apt-get update
apt-get -y install kurento-media-server-6.0
