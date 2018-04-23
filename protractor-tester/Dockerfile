FROM ubuntu:xenial
MAINTAINER rajudev

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install curl gpg apt-utils git wget openjdk-8-jdk openjdk-8-jre #installing java which is required by selenium to work

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - #install nodejs and npm

RUN apt-get install -y nodejs figlet chromium firefox xvfb recordmydesktop #install xvfb for headless display and the screen recorder for recording tests.

#Check version of respective packages
RUN nodejs --version | figlet #check version of nodejs
RUN npm --version | figlet #check version of npm
RUN firefox -v #check version of firefox
RUN java -version #check version of java

# Do some clean up. 
RUN apt-get -y autoremove --purge
RUN apt-get clean

# Install the node related packages

RUN npm install -g protractor #install protractor
RUN protractor --version #check version of protractor

RUN npm install -g bower #install bower
RUN bower -v | figlet #checking version of bower
RUN npm install gulp-cli -g
RUN npm install gulp -D
RUN gulp --version

#Setup the environemnt for running web-driver

RUN webdriver-manager update #update the selenium webdriver
EXPOSE 80
EXPOSE 4444
EXPOSE 44751
EXPOSE 37411