FROM alpine:3.8

RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.8/main > /etc/apk/repositories; \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories

RUN \
    apk add --no-cache bash curl libxml2-utils && \
    mkdir -p /tmp/work && \
    mkdir -p /opt/scripts

COPY wrapper.sh /opt/scripts

WORKDIR /tmp/work

ENTRYPOINT ["sh",  "/opt/scripts/wrapper.sh"]