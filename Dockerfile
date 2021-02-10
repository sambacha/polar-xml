FROM alpine:3.12


RUN addgroup -g 1000 app \
    && adduser -u 1000 -G app -s /bin/sh -D app

RUN RUN apk add --no-cache \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.12/main > /etc/apk/repositories; \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.12/community >> /etc/apk/repositories \
    mkdir -p /opt/polar/app

RUN \
    apk add --no-cache bash curl libxslt libxml2-utils && \
    mkdir -p /service/ && \
    mkdir -p /opt/polar

COPY wrapper.sh /opt/polar

COPY wrapper.sh /opt/polar \
     XSLTLint.xslt /opt/polar/ \
     alpine-xmllint.sh alpine-xmllint.sh/


# Create the working folder and change owner
WORKDIR /service
RUN chown -R app:app /service
USER app  

ENTRYPOINT ["bash",  "/opt/polar/wrapper.sh"]
