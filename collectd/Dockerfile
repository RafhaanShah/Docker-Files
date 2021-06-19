# https://collectd.org/
FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
    collectd

ENTRYPOINT [ "collectd", "-f" ]
