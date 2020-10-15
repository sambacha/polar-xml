FROM alpine:3.8


RUN addgroup -g 1000 app \
    && adduser -u 1000 -G app -s /bin/sh -D app

RUN RUN apk add --no-cache \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.8/main > /etc/apk/repositories; \
    echo http://dl-cdn.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories \
    mkdir -p /opt/polar/app

RUN \
    apk add --no-cache bash curl libxslt libxml2-utils && \
    mkdir -p /wrk/ && \
    mkdir -p /opt/polar

COPY wrapper.sh /opt/polar

COPY wrapper.sh /opt/polar \
     XSLTLint.xslt /opt/polar/ \
     alpine-xmllint.sh alpine-xmllint.sh/
# Create the working folder and change owner
WORKDIR /wrk
RUN chown -R app:app /wrk
USER app  

ENTRYPOINT ["sh",  "/opt/polar/wrapper.sh"]
