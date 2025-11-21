ARG TORBASE_VERSION=latest
FROM quay.io/seiferma/tor-base:${TORBASE_VERSION}

ARG IRSSI_VERSION
ARG TTYD_VERSION
ARG ABDUCO_VERSION

RUN http_proxy= && \
    https_proxy= && \
    apk add irssi=${IRSSI_VERSION} ttyd=${TTYD_VERSION} abduco=${ABDUCO_VERSION}

ADD entrypoint-irssi.sh /entrypoint-irssi.sh

ENV DATA_VOLUME=/home/irssi-dckr
VOLUME ${DATA_VOLUME}
EXPOSE 8080/tcp

ENTRYPOINT ["/entrypoint-irssi.sh"]
HEALTHCHECK --interval=30s --timeout=30s --start-period=20s --retries=3 CMD /usr/bin/wget -Y off --spider http://127.0.0.1:8080 || exit 1
CMD ["default"]
