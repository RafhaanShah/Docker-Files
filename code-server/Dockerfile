# https://github.com/cdr/code-server
FROM codercom/code-server:latest

# Installs Go, Node, Python, Java, Ruby, Rust
# Installs Docker (executable only) and Docker-Compose
# Installs Chrome for localhost previews
# Sets default shell to ZSH, clones and sets up Dotfiles

ENV GOLANG_VERSION=1.16
ENV NODE_VERSION=15
ENV DOCKER_VERSION=20.10.5
ENV DOCKERCOMPOSE_VERSION=1.28.5
ENV DOCKER_GROUP=999
ENV GCM_URL=https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.318-beta/gcmcore-linux_amd64.2.0.318.44100.deb

RUN sudo apt update \
    && sudo apt upgrade -y \
    && sudo apt install -yq --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    openjdk-11-jdk-headless \
    ruby-full \
    gnupg pass pinentry-tty \
    zsh \
    && python3 --version \
    && pip3 --version \
    && java --version \
    && ruby --version

RUN curl -sSL "https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz" | sudo tar -C /usr/local -xz && /usr/local/go/bin/go version \
    && curl -sSL "https://deb.nodesource.com/setup_${NODE_VERSION}.x" | sudo -E bash - \
    && sudo apt install -yq nodejs && node --version && npm --version && mkdir -p ~/.npm-global && npm config set prefix ~/.npm-global \
    && curl https://sh.rustup.rs -sSf | sh -s -- -y && . "${HOME}/.cargo/env" && rustc --version \
    && curl -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb \
    && sudo sudo apt install -y ./chrome.deb && rm chrome.deb \
    && curl -sSL ${GCM_URL} -o gcm.deb \
    && sudo dpkg -i gcm.deb && rm gcm.deb

RUN curl -sSLO "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
    && sudo tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
    && rm docker-${DOCKER_VERSION}.tgz \
    && docker --version \
    && sudo curl -sSL "https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && docker-compose --version \
    && sudo groupadd -g ${DOCKER_GROUP} docker && sudo usermod -a -G docker ${USER}

# This directory is needed so permissions stay OK when mounting the config volume here
RUN mkdir -p ~/.local/share/code-server \
    && git clone https://github.com/RafhaanShah/Dotfiles ~/Dotfiles \
    && ~/Dotfiles/setup/dotfiles.sh \
    && ~/Dotfiles/setup/fonts.sh \
    && ~/Dotfiles/setup/zsh.sh
