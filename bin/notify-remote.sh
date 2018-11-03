#!/bin/bash -e

read line
URGENCY="$line"
read line
TITLE="$line"
read line
MESSAGE="$line"
read line
DELIM="$line"

[[ $URGENCY =~ ^(low|normal|critical)$ ]] || exit 1;

if [ "$DELIM" == "" ] && [ "$TITLE" != "" ]; then
  notify-send -u $URGENCY -- "$TITLE" "$MESSAGE"
fi

exit 0
