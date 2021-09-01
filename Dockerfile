FROM quay.io/seiferma/tor-base:latest

RUN apk add irssi
RUN adduser -h /home/irssi -D irssi

VOLUME ["/home/irssi"]

CMD ["su-exec", "irssi", "torsocks", "irssi"]
