#!/bin/bash

PARENT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
webhookfile="$PARENT_DIR/webhook.txt"

if [[ ! -f "$webhookfile" ]]; then
  echo -n "Enter the slack webhook URL: "
  read webhook
  echo "$webhook" > "$webhookfile"
else
  echo "$webhookfile already exists, you can edit it if you want to change the webhook URL."
fi

