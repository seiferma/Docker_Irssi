#!/bin/sh

set -e
/entrypoint.sh true

CMD=$1

if [[ "$CMD" == "default" ]]; then
	su-exec irssi ttyd -p 8080 abduco -a irssi &> /tmp/ttyd.log &
	su-exec irssi abduco -c irssi torsocks irssi
else
	exec "$@"
fi
