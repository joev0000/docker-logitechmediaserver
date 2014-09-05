# docker-logitechmediaserver

Docker image for Logitech Media Server (SqueezeCenter, SqueezeboxServer, SlimServer),
derived from a Debian Wheezy image.

Run with:

```
docker run -d \
           -p 9000:9000 \
           -p 3483:3483 \
           -p 3483:3483/udp \
           -v <local-state-dir>:/mnt/state \
           -v <audio-dir>:/mnt/music \
           logitechmediaserver
```

### Acknowledgements
* <a href="https://github.com/jinglemansweep">JingleManSweep</a>, who created the repository from which this is forked.
