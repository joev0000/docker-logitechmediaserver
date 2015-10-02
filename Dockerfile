FROM debian:wheezy

MAINTAINER Joseph Vigneau <joev@alum.wpi.edu>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://debian.slimdevices.com stable main" | tee -a /etc/apt/sources.list
RUN echo "deb http://www.deb-multimedia.org wheezy main non-free" | tee -a /etc/apt/sources.list
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
  faad \
  faac \
  flac \
  lame \
  sox \
  supervisor \
  wavpack \
  logitechmediaserver

RUN mkdir -p /var/log/supervisor

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN rm -rf /usr/share/squeezeboxserver/Bin/i386-linux; ln -s /usr/bin /usr/share/squeezeboxserver/Bin/i386-linux

VOLUME ["/mnt/state"]
EXPOSE 3483 3483/udp 9000 9090

CMD ["/usr/bin/supervisord"]

