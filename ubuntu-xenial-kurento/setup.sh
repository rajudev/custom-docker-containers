
# Remove the "unable to initialize frontend: Dialog"
export DEBIAN_FRONTEND=noninteractive

apt-get update
#apt-get -y dist-upgrade

# let's install apt-utils first to get rid of apt errors
apt-get -y install apt-utils

#lets install some more required utilities

apt-get install -y wget curl

#Add Kurento's repositories


echo "deb http://ubuntu.kurento.org/ xenial kms6" | tee /etc/apt/sources.list.d/kurento.list \
	&& wget -O - http://ubuntu.kurento.org/kurento.gpg.key | apt-key add - \
	&& apt-get update

# Install build Pre requisites

echo "Installing build dependencies"
apt-get -y install git build-essential devscripts

apt-get -y  install cmake debhelper binutils kms-core-6.0-dev kms-elements-6.0-dev kms-filters-6.0-dev \
				libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev \
				libboost-test-dev libboost-thread-dev libboost-log-dev libevent-dev libssl-dev

apt-get -y install libboost-all-dev libssl-dev pkg-config libevent-dev


#install kurento-media-server

apt-get -y install kurento-media-server-6.0


#Install the coturn server
apt-get -y  install coturn
