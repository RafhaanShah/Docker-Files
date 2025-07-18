FROM alpine:3

ARG VSCODE_URL='https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64'
ARG VSCODE_USER="vscode"
ARG VSCODE_UID=1000
ARG VSCODE_GID=1000

RUN apk add --no-cache \
    curl \
    tar \
    expect \
    libstdc++ \
    git \
    openssh \
    docker-cli

RUN addgroup -S -g ${VSCODE_GID} "${VSCODE_USER}" && \
    adduser -S -u ${VSCODE_UID} "${VSCODE_USER}" -G "${VSCODE_USER}" -s /bin/ash

USER "${VSCODE_USER}"

WORKDIR "/home/${VSCODE_USER}/"

RUN curl -Lk "${VSCODE_URL}" --output vscode_cli.tar.gz && \
    tar -xf vscode_cli.tar.gz && \
    rm vscode_cli.tar.gz

COPY --chown="${VSCODE_USER}:${VSCODE_USER}" . .

ENTRYPOINT ["./start.sh"]

HEALTHCHECK --interval=60s --timeout=10s \
    --start-period=60s --start-interval=10s \
    --retries=5 \
    CMD "./health.sh"
