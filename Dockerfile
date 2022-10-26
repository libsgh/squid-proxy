FROM ubuntu:18.04
MAINTAINER Libs
LABEL Description="Squid forward proxy with authorization" Vendor="Libs" Version="1.0"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y squid
RUN apt-get install -y apache2-utils
RUN apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entry.sh"]
