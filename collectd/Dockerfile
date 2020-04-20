FROM ubuntu:latest

RUN apt update \
    && apt install collectd -y --no-install-recommends

CMD collectd -f
