#!/bin/bash -e

if [ "$1" = "MSG" ] && [ "$2" = "IN" ]; then
  notify-send -u normal -c presence -- "Jabber" "$3"
fi

exit 0
