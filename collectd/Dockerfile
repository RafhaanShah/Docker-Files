FROM ubuntu:latest

RUN apt update \
    && apt install -y \
    collectd

ENTRYPOINT [ "collectd", "-f" ]
