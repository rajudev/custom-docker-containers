FROM alpine
MAINTAINER rajudev

RUN apk update
RUN apk add --no-cache vim nano
RUN wget https://github.com/compose/transporter/releases/download/v0.5.2/transporter-0.5.2-linux-amd64 -O /usr/local/bin/transporter
RUN chmod +x /usr/local/bin/transporter
