FROM quay.io/seiferma/tor-base:latest

RUN http_proxy= && \
    https_proxy= && \
    apk add irssi ttyd abduco

ADD entrypoint-irssi.sh /entrypoint-irssi.sh

ENV DATA_VOLUME=/home/irssi-dckr
VOLUME ${DATA_VOLUME}
EXPOSE 8080/tcp

ENTRYPOINT ["/entrypoint-irssi.sh"]
CMD ["default"]
