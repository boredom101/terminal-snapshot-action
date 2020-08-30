FROM ubuntu:xenial

RUN apt-get update && apt-get install -y xvfb imagemagick xterm x11-xserver-utils

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
