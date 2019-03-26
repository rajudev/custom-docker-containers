#!/bin/bash -x
set -e

if [ -n "$KMS_TURN_URL" ]; then
  echo "turnURL=$KMS_TURN_URL" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
fi

if [ -n "$KMS_STUN_IP" -a -n "$KMS_STUN_PORT" ]; then
  # Generate WebRtcEndpoint configuration
  echo "stunServerAddress=$KMS_STUN_IP" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  echo "stunServerPort=$KMS_STUN_PORT" >> /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
fi

# Remove ipv6 local loop until ipv6 is supported
cat /etc/hosts | sed '/::1/d' | tee /etc/hosts > /dev/null



# Turnserver Configuration
if [ -n "$KMS_STUN_IP" -a -n "$USER" -a -n "$PASS" ]; then
	#generate /etc/turnserver.conf config
	echo "external-ip=$KMS_STUN_IP" >> /etc/turnserver.conf
	echo "fingerprint" >> /etc/turnserver.conf
	echo "user=$USER:$PASS" >> /etc/turnserver.conf
	echo "lt-cred-mech" >> /etc/turnserver.conf
	echo "realm=kurento.org" >> /etc/turnserver.conf
	echo "log-file=/var/log/turnserver/turnserver.log" >> /etc/turnserver.conf
	echo "simple-log" >> /etc/turnserver.conf
fi

#Enable Coturn server
echo "TURNSERVER_ENABLED=1" > /etc/default/coturn

service coturn restart

exec /usr/bin/kurento-media-server "$@"
