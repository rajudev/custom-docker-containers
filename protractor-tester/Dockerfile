FROM ubuntu:xenial
MAINTAINER rajudev

ENV DEBIAN_FRONTEND noninteractive #Telling the terminal to behave in a non-interactive environment

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade #upgrading the machine to the latest available state

RUN apt-get -y install curl gnupg apt-utils git wget openjdk-8-jdk openjdk-8-jre #installing some essential dependencies

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - #install nodejs and npm from a convenience script

RUN apt-get install -y nodejs figlet chromium-browser firefox xvfb recordmydesktop #install xvfb firefox and chromium and other essentials.

#Check version of respective packages
RUN nodejs --version | figlet #check version of nodejs
RUN npm --version | figlet #check version of npm
RUN firefox -v #check version of firefox
RUN chromium-browser --version #check version of chromium browser
RUN java -version #check version of java

# Do some clean up. 
RUN apt-get -y autoremove --purge
RUN apt-get clean

# Install the node related packages

RUN npm install -g protractor #install protractor
RUN protractor --version #check version of protractor
RUN npm install --save-dev jasmine-reporters@^2.0.0 #Install jasmine-reporters
RUN npm install -g bower #install bower
RUN bower -v | figlet #checking version of bower
RUN npm install gulp-cli -g
RUN npm install gulp -D
RUN gulp --version

#Setup the environemnt for running web-driver

RUN webdriver-manager update #update the selenium webdriver