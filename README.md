# Docker Container for Logitech Media Server

[![Docker Repository on Quay.io](https://quay.io/repository/jinglemansweep/logitechmediaserver/status "Docker Repository on Quay.io")](https://quay.io/repository/jinglemansweep/logitechmediaserver)

Docker image for Logitech Media Server (SqueezeCenter, SqueezeboxServer, SlimServer),
derived from a Debian Wheezy image.

Run Directly:

```
docker run -d \
           -p 9000:9000 \
           -p 3483:3483 \
           -p 3483:3483/udp \
           -v <local-state-dir>:/mnt/state \
           -v <audio-dir>:/mnt/music \
           jinglemansweep/logitechmediaserver
```

### Acknowledgements
* <a href="https://github.com/jinglemansweep">JingleManSweep</a>, who created the repository from which this is forked.
