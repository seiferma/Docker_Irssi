FROM quay.io/seiferma/tor-base:latest

RUN http_proxy= && \
    https_proxy= && \
    apk add irssi ttyd abduco
RUN adduser -h /home/irssi -D irssi

ADD entrypoint-irssi.sh /entrypoint-irssi.sh

VOLUME ["/home/irssi"]
EXPOSE 8080/tcp

ENTRYPOINT ["/entrypoint-irssi.sh"]
CMD ["default"]
