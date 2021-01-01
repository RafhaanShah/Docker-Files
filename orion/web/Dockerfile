# https://github.com/LINKIWI/orion-web
FROM node:8.9.3-alpine

RUN apk update && apk add curl unzip

RUN curl -L -o orion-web-master.zip https://github.com/LINKIWI/orion-web/archive/master.zip \
    && unzip orion-web-master.zip
WORKDIR "/orion-web-master"

RUN npm install && npm install -g node-static

ARG ORION_SERVER_URL
ARG MAPBOX_API_TOKEN

ENV NODE_ENV production
ENV ORION_SERVER_URL $ORION_SERVER_URL
ENV MAPBOX_API_TOKEN $MAPBOX_API_TOKEN

RUN npm run build

EXPOSE 8080

CMD ["static", "dist", "-a", "0.0.0.0", "-p", "8080"]
