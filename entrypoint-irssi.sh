#!/bin/sh

set -e
/entrypoint.sh true

USER_NAME=irssi-dckr
GROUP_NAME=irssi-dckr

echo "Generating user account"
if [ "$IRSSI_GID" == "" ]; then
	export IRSSI_GID=1000
fi
if [ "$IRSSI_UID" == "" ]; then
	export IRSSI_UID=1000
fi
addgroup -g $IRSSI_GID $GROUP_NAME
adduser -D -H -G $GROUP_NAME -u $IRSSI_UID $USER_NAME
mkdir -p $DATA_VOLUME
chown $USER_NAME:$GROUP_NAME $DATA_VOLUME

if [ "$1" == "default" ]; then
        echo "Starting irssi"
		su-exec $USER_NAME ttyd -W -p 8080 abduco -a irssi &> /tmp/ttyd.log &
		nft add rule filter INPUT tcp dport 8080 ct state new accept
		su-exec $USER_NAME abduco -c irssi torsocks irssi
else
	echo "Executing command"
	exec "$@"
fi
