FROM alpine:3.9
MAINTAINER Hussein Galal

# install giddyup

RUN apk add -U curl \
    && mkdir -p /opt/rancher/bin \
    && curl -L https://github.com/rancher/giddyup/releases/download/v0.14.0/giddyup -o /opt/rancher/bin/giddyup \ 
    && chmod u+x /opt/rancher/bin/*

RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*
RUN openssl rand -base64 756 > /opt/rancher/bin/key.cert
RUN chmod 400 /opt/rancher/bin/key.cert
ADD ./*.sh /opt/rancher/bin/
RUN chmod u+x /opt/rancher/bin/*.sh

VOLUME /opt/rancher/bin
