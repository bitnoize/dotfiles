#!/bin/bash -e

PAIR=${PAIR:-"btcusd"}

curl -s "https://www.bitstamp.net/api/v2/ticker/$PAIR" | jq -r .last

