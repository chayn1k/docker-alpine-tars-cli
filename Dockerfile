FROM mhart/alpine-node:latest
MAINTAINER Pavel Tchaikovsky <pavel@tchaikovsky.tk>

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        bash \
    && apk add --no-cache \
        autoconf \
        automake \
        bzip2 \
        file \
        g++ \
        gcc \
        make \
        python \        
        git \
    && rm -rf /var/cache/apk/* \
    && npm install -g \
        babel-eslint \
        gulp \
    && npm install -g \
        tars-cli \
    && npm cache clear

WORKDIR /root

CMD /bin/bash