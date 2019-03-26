
Kurento
=======

What is Kurento?
---------------

Kurento is an open source software project providing a platform suitable
for creating modular applications with advanced real-time communication
capabilities. For knowing more about Kurento, please visit the Kurento
project website: http://www.kurento.org.



# Instructions for the informed and impatient.

### Pull and start the containers
```
$ docker run --name kms -p 8888:8888 -d rajudev/kurento-media-server
```
Verify if the container is ready and listening.
```
$ curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: 127.0.0.1:8888" -H "Origin: 127.0.0.1" http://127.0.0.1:8888/kurento
```
You will get something like:

> HTTP/1.1 500 Internal Server Error

> Server: WebSocket++/0.7.0

Don't worry about the second line (500 Internal Server Error). It's ok,
because we are not talking the protocol kurento media server expects, we are
just checking that the server is up and listening for connections.

### Start the container with some Configuration
You need to determine the values of the following variables

$KMS_TURN_URL - your turn server URL

$KMS_STUN_IP - your turn server IP

$KMS_STUN_PORT - the port to use for turn Server

$USER - the default username for the admin of the turn server

$PASS - the password for the above user.

Then you need to pass these values to along with the above command. with the -e flag.
You need to prefix -e before each URL.


```
$ docker run -d --name kms -e [Your variables along with there values] rajudev/kurento-media-server
```
example values for the variables

KMS_TURN_URL='myawesomesite.com'

KMS_STUN_IP='81.43.53.43'

KMS_STUN_PORT='7777'

USER='foo'

PASS='foobar'

example command with full configurations
```
$ docker run -d --name kms -e KMS_TURN_URL='myawesomesite.com' \
-e KMS_STUN_IP='81.43.53.43' -e KMS_STUN_PORT='7777' \
-e USER='foo' -e PASS='foobar' -e KM rajudev/kurento-media-server
```


# Instructions for the un/informed and curious.

### Instructions for spawning your own container without pulling from registry.

After cloning the code

1. `cd` into the folder you want to build the container for.
2. Specify the base image you want to build the container from in the `Dockerfile`
3. Put your changes that you want to do in `setup.sh`
4. build the container with `docker build -t <name-that-you-want-for-container>:tag .`
	e.g. `docker build -t ubuntu-xenial-kurento:latest`
5. Once the image builds you should see it in the list of downloaded docker images with `docker images`



kurento-media-server
====================

# How to use this image

## Start a `kurento-media-server` instance

Starting a Kurento media server instance is easy. Kurento media server exposes
port 8888 for client access. So, assuming you want to map port 8888 in the
instance to local port 8888, you can start kurento media server with:

```console
$ docker run --name kms -p 8888:8888 -d rajudev/kurento-media-server
```

To check that kurento media server is ready and listening, issue the following
command (you need to have curl installed on your system):

```console
$ curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: 127.0.0.1:8888" -H "Origin: 127.0.0.1" http://127.0.0.1:8888/kurento
```

You will get something like:


> HTTP/1.1 500 Internal Server Error

> Server: WebSocket++/0.7.0

Don't worry about the second line (`500 Internal Server Error`). It's ok,
because we are not talking the protocol kurento media server expects, we are
just checking that the server is up and listening for connections.

## Kurento media server logs

The kurento media server log is available through the usual way Docker exposes
logs for its containers. So assuming you named your container `kms` (with
`--name kms` as we did above):

```console
$ docker logs kms
```

## Environment variables
You need to determine the values of the following variables

$KMS_TURN_URL - your turn server URL

$KMS_STUN_IP - your turn server IP

$KMS_STUN_PORT - the port to use for turn Server

$USER - the default username for the admin of the turn server

$PASS - the password for the above user.

Then you need to pass these values to along with the above command. with the -e flag.
You need to prefix -e before each URL.


```
$ docker run -d --name kms -e [Your variables along with there values] rajudev/kurento-media-server
```
example values for the variables

KMS_TURN_URL='myawesomesite.com'

KMS_STUN_IP='81.43.53.43'

KMS_STUN_PORT='7777'

USER='foo'

PASS='foobar'


example command with full configurations
```
$ docker run -d --name kms -e KMS_TURN_URL='myawesomesite.com' \
-e KMS_STUN_IP='81.43.53.43' -e KMS_STUN_PORT='7777' \
-e USER='foo' -e PASS='foobar' -e KM rajudev/kurento-media-server
```
## Get help about kurento media server

```console
$ docker run --rm kurento/kurento-media-server --help
```
