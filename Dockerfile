FROM node:14-alpine 

RUN set -ex; apk add --no-cache --virtual .fetch-deps curl tar git ;

WORKDIR /app

COPY package.json /app

RUN npm install --production

COPY api /app/api

COPY app.js /app

COPY config /app/config

COPY util /app/util

ENV IMAGE_TAG=__image_tag__

EXPOSE 10003

#RUN adduser -D appuser
#RUN chown -R appuser /app
#USER appuser

CMD node app.js