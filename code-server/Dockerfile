# https://github.com/cdr/code-server
FROM codercom/code-server:latest

ENV GOLANG_VERSION 1.15.5
ENV NVM_VERSION 0.37.0
ENV DOCKER_VERSION 19.03.13
ENV DOCKERCOMPOSE_VERSION 1.27.4
ENV DOCKER_GROUP 999

RUN sudo apt update \
    && sudo apt upgrade -y \
    && sudo apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    openjdk-11-jdk-headless \
    gnupg2 pass pinentry-tty \
    && sudo rm -rf /var/lib/apt/lists/* \
    && python3 --version \
    && pip3 --version \
    && java --version

RUN curl -sSL "https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz" | sudo tar -C /usr/local -xz \
    && /usr/local/go/bin/go version
ENV PATH /usr/local/go/bin:${PATH}

ENV NVM_DIR /home/coder/.nvm
RUN curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash \
    && [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh" \
    && nvm install node \
    && node --version \
    && npm --version

RUN curl -fsSLO "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
    && sudo tar xzvf docker-${DOCKER_VERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
    && rm docker-${DOCKER_VERSION}.tgz \
    && docker --version

RUN sudo curl -sSL "https://github.com/docker/compose/releases/download/${DOCKERCOMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && docker-compose --version

RUN mkdir -p ~/.local/share \
    && sudo chown coder:coder ~/.local && sudo chown coder:coder ~/.local/share \
    && echo 'export PATH="${PATH}:~/.local/bin"' >> ~/.bashrc

RUN sudo groupadd -g ${DOCKER_GROUP} docker && sudo usermod -a -G docker ${USER}
