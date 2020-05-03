# https://github.com/prasathmani/tinyfilemanager
FROM php:7.4-cli

ENV TFM_URL https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/tinyfilemanager.php

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    wget \
    zlib1g-dev \
    libzip-dev \
    && docker-php-ext-install zip

RUN mkdir -p /web/data && \
    wget -O /web/index.php $TFM_URL

ADD .env /web
WORKDIR /web

RUN eval $(sed 's/^/export /' .env) && rm .env \
    && ADMIN_HASH=$(php -r "echo password_hash(\"${ADMIN_PASSWORD}\", PASSWORD_DEFAULT);") \
    && USER_HASH=$(php -r "echo password_hash(\"${USER_PASSWORD}\", PASSWORD_DEFAULT);") \
    && sed -i "s|_SERVER\['DOCUMENT_ROOT'\];|_SERVER\['DOCUMENT_ROOT'\].'/data';|" index.php \
    && sed -i "s|default_timezone = .*|default_timezone = '${TZ}';|" index.php \
    && sed -i "s|'admin' => .*|'admin' => '${ADMIN_HASH}',|" index.php \
    && sed -i "s|'user' => .*|'user' => '${USER_HASH}'|" index.php \
    && unset ADMIN_PASSWORD ADMIN_HASH USER_PASSWORD USER_HASH

EXPOSE 8080

ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "-t", "./", "./index.php" ]
