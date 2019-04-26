FROM docker.elastic.co/kibana/kibana:6.7.1
MAINTAINER rajudev

USER root

RUN yum install -y epel-release
RUN yum install -y openssl nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN echo "Docker!" | passwd --stdin root

ENV PATH="/usr/share/kibana/node/bin:${PATH}"

RUN kibana-plugin install https://github.com/wtakase/kibana-own-home/releases/download/v6.7.1/own_home-6.7.1.zip
RUN kibana-plugin install https://search.maven.org/remotecontent?filepath=com/floragunn/search-guard-kibana-plugin/6.7.1-18.3/search-guard-kibana-plugin-6.7.1-18.3.zip

EXPOSE 80
CMD nginx && kibana
