# https://github.com/prasathmani/tinyfilemanager
FROM php:7.4-cli

ENV TFM_URL https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/tinyfilemanager.php
ENV CFG_URL https://raw.githubusercontent.com/prasathmani/tinyfilemanager/master/config.php

RUN apt update \
    && apt upgrade -y \
    && apt install -y wget zlib1g-dev libzip-dev \
    && docker-php-ext-install zip

WORKDIR /web

RUN mkdir -p /web/data \
    && wget -O /web/index.php $TFM_URL \
    && wget -O /web/config.php $CFG_URL \
    && sed -i "s|_SERVER\['DOCUMENT_ROOT'\];|_SERVER\['DOCUMENT_ROOT'\].'/data';|" config.php \
    && sed -i "s|max_upload_size_bytes = 2048|max_upload_size_bytes = 67108864|" config.php \
    && sed -i "s|highlightjs_style = 'vs'|highlightjs_style = 'ir-black'|" config.php \
    && sed -i "s|default_timezone = .*|default_timezone = '${TZ}';|" config.php \
    && sed -i "s|root_url = ''|root_url = '/data';|" config.php \
    && sed -i "s|use_auth = true|use_auth = false|" config.php \
    && sed -i "s|theme = 'light'|theme = 'dark'|" config.php

EXPOSE 8080

ENTRYPOINT [ "php", "-S", "0.0.0.0:8080"]
