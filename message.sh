#!/bin/bash
text="$@"

PARENT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
webhookfile="$PARENT_DIR/webhook.txt"

curl -X POST -H 'Content-type: applicaion/json' --data '{"text":"'"$text"'"}' $(cat "$webhookfile")
