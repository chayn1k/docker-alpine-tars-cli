FROM alpine:latest
MAINTAINER Pavel Tchaikovsky <pavel.tchaikovsky+docker@gmail.com>
LABEL Description="This image is used to build project used tars-cli"

RUN apk update \
    && apk upgrade \
    && apk --update --no-progress add \
        bash \
        git \
        wget \
        curl \
        autoconf \
        automake \
        bzip2 \
        zlib-dev \
        nasm \
        file \
        g++ \
        gcc \
        make \
        python \
        nodejs \
        imagemagick \
    && npm install -g npm \
    && export USER=root \
    && npm config set python /usr/bin/python \
    && npm config set python2 /usr/bin/python \
    && npm install -g \
        gulp \
        babel-eslint \
    &&  npm install -g tars-cli \
    && apk del \
        bzip2 \
        zlib-dev \
        nasm \
        file \
        g++ \
    && rm -rf /var/cache/apk/*

WORKDIR /root
CMD /bin/bash
