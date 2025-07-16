# https://collectd.org/
FROM alpine:3

RUN apk add --no-cache \
    collectd \
    collectd-curl

ENTRYPOINT [ "collectd", "-f" ]
