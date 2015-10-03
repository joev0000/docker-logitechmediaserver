# Use: docker run --rm --name lms -p 9000:9000 -p 9090:9090 -p 3483:3483 -p 3483:3483/udp  -v /storage/lms:/mnt/state -v /storage/media/music:/mnt/music -e TZ=America/New_York -e LANG=en_US.utf8   lms

FROM debian:jessie

MAINTAINER Joseph Vigneau <joev@alum.wpi.edu>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.deb-multimedia.org jessie main non-free" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y --force-yes install \
  apt-utils \
  curl \
  faad \
  faac \
  flac \
  lame \
  locales \
  perl5 \
  sox \
  supervisor \
  wavpack

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN dpkg-reconfigure locales

RUN curl -o /tmp/lms.deb http://downloads.slimdevices.com/nightly/7.9/sc/3f9860f/logitechmediaserver_7.9.0~1443715562_all.deb && dpkg --install /tmp/lms.deb ; rm /tmp/lms.deb

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


VOLUME ["/mnt/state", "/mnt/music"]]
EXPOSE 3483 3483/udp 9000 9090

CMD ["/usr/bin/supervisord"]

