# Docker Container for Logitech Media Server 7.9.1

Docker image for <a href="https://github.com/Logitech/slimserver">Logitech Media Server</a>
(aka SqueezeCenter, SqueezeboxServer, SlimServer).

Run Directly:

```
docker run -d \
           -p 9000:9000 \
           -p 3483:3483 \
           -p 3483:3483/udp \
           -v <local-state-dir>:/mnt/state \
           -v <audio-dir>:/mnt/music \
           <image>
```

### Acknowledgements
* <a href="https://github.com/jinglemansweep">JingleManSweep</a>, who created the repository from which this is forked.
