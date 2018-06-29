# Use: docker run --rm --name lms -p 9000:9000 -p 9090:9090 -p 3483:3483 -p 3483:3483/udp  -v /storage/lms:/mnt/state -v /storage/media/music:/mnt/music -e TZ=America/New_York -e LANG=en_US.utf8   lms

FROM debian:stretch-slim

MAINTAINER Joseph Vigneau <joev@alum.wpi.edu>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.deb-multimedia.org stretch main non-free" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get --assume-yes --allow-unauthenticated install \
  apt-utils \
  curl \
  faad \
  faac \
  flac \
  lame \
  libio-socket-ssl-perl \
  locales \
  perl \
  sox \
  wavpack

RUN curl -o /tmp/lms.deb http://downloads.slimdevices.com/LogitechMediaServer_v7.9.1/logitechmediaserver_7.9.1_amd64.deb && dpkg --install /tmp/lms.deb ; rm /tmp/lms.deb

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN dpkg-reconfigure locales

VOLUME ["/mnt/state", "/mnt/music"]
EXPOSE 3483 3483/udp 9000 9090

CMD ["/usr/sbin/squeezeboxserver", "--user", "root", "--prefsdir", "/mnt/state/prefs", "--logdir", "/mnt/state/logs", "--cachedir", "/mnt/state/cache"]
