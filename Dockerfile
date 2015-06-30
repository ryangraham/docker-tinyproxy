FROM phusion/baseimage:latest

MAINTAINER Ryan Graham <ryangraham@gmail.com>

RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install tinyproxy

RUN sed -i 's/nobody/root/g' /etc/tinyproxy.conf
RUN sed -i -e"s/^Allow /#Allow /" /etc/tinyproxy.conf

RUN mkdir -m 777 /var/run/tinyproxy/

EXPOSE 8888
ENTRYPOINT ["/usr/sbin/tinyproxy", "-d"]
