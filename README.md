# Docker Container for Logitech Media Server

Docker image for Logitech Media Server (SqueezeCenter, SqueezeboxServer, SlimServer).

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
