FROM alpine:3.20 AS base
RUN apk update --no-cache \
    && apk upgrade \
    && apk add --no-cache "mono>=6.12.0.205" --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && apk add --no-cache --virtual=.build-dependencies ca-certificates \
    && cert-sync /etc/ssl/certs/ca-certificates.crt \
    && apk del .build-dependencies \
    \
    && addgroup -g 500 static \
    && adduser -u 500 -G static -s /bin/sh -D static

FROM base AS dl
RUN apk add "wget>=1.24.4" --no-cache \
    && wget --quiet -O /tmp/Klondike.zip https://github.com/chriseldredge/Klondike/releases/download/v2.1.1/Klondike.2.1.1.22ea5477-build156.zip \
    && unzip /tmp/Klondike.zip -d /tmp/kd \
    && rm /tmp/Klondike.zip \
    && chmod +x /tmp/kd/bin/Klondike.SelfHost.exe

FROM base AS run
COPY --from=dl --chown=static:static "/tmp/kd" "/app"
COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8080
ENTRYPOINT ["./run.sh"]

LABEL org.opencontainers.image.title="Klondike (Unofficial)"
LABEL org.opencontainers.image.source="https://github.com/hudsonm62/docker-klondike"
