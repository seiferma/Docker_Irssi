FROM ghcr.io/seiferma/torbase:latest

RUN apk add irssi
RUN adduser -h /home/irssi -D irssi

VOLUME ["/home/irssi"]

CMD ["su-exec", "irssi", "torsocks", "irssi"]
