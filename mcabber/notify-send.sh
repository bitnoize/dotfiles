#!/bin/sh -e

TYPE=$1; SUBTYPE=$2; JID=$3; FILE=$4
#echo "$TYPE $SUBTYPE $JID $FILE" >> ~/.mcabber/mcabber.log

if [ "$TYPE" = "MSG" ] && [ "$SUBTYPE" = "IN" ]; then
  notify-send -u normal -c presence -- "Jabber" "$JID"
fi

exit 0
