#!/bin/bash

URL="https://api.quotable.io/random"

RESPONSE=$(curl -ks "$URL")

QUOTE=$(echo "$RESPONSE" | jq -r '.content')
AUTHOR=$(echo "$RESPONSE" | jq -r '.author')

notify-send "Triggered Quote for $USER@$HOSTNAME :" "\"$QUOTE\"\n— $AUTHOR"

# * * * * * DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus bash /path/to/quote.sh


