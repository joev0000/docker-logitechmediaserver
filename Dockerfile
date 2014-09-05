FROM debian:wheezy

MAINTAINER Joseph Vigneau <joev@alum.wpi.edu>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://debian.slimdevices.com stable main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y --force-yes install \
  libdbi-perl \
  libev-perl \
  libxml-parser-perl \
  libhtml-parser-perl \
  libjson-xs-perl \
  libdigest-sha-perl \
  libyaml-perl \
  libsub-name-perl \
  logitechmediaserver

ADD ./startup.sh /startup.sh
RUN chmod u+x /startup.sh

EXPOSE 3483 3483/udp 9000 9090

ENTRYPOINT ["/startup.sh"]

