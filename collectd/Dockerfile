# https://collectd.org/
FROM alpine:3

RUN apk add --no-cache \
    collectd \
    collectd-curl

ENTRYPOINT [ "collectd", "-f" ]

HEALTHCHECK --interval=60s --timeout=5s \
    --start-period=60s --start-interval=5s \
    --retries=5 \
    CMD pgrep collectd || exit 1
