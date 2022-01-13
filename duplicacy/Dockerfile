FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
    curl

RUN curl -LJo duplicacy https://acrosync.com/duplicacy-web/duplicacy_web_linux_x64_1.5.0 && \
    chmod 755 duplicacy

ENTRYPOINT [ "./duplicacy" ]
