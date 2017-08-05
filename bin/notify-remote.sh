#!/bin/bash -e

read line
TITLE="$line"
read line
MESSAGE="$line"
read line
DELIM="$line"

if [ "$DELIM" == "" ] && [ "$TITLE" != "" ]; then
  notify-send -u normal -t 0 -- "$TITLE" "$MESSAGE"
fi

exit 0
