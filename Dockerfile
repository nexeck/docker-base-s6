FROM nexeck/base

MAINTAINER Marcel Beck <marcel@beck.im>

# S6
ENV S6_OVERLAY_VERSION=1.19.1.1

RUN apk add --no-cache --virtual .build-deps curl \
 && curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
  | tar xzf - -C / \
 && apk del .build-deps

ENTRYPOINT [ "/init" ]
