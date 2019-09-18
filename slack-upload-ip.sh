#!/bin/bash

PARENT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
webhookfile="$PARENT_DIR/webhook.txt"
file="$PARENT_DIR/ip_a_inet.txt"

if [[ "$1" == --setup ]]; then
  "$PARENT_DIR/setup-webhook.sh"
  CRON_JOB="*/5 * * * * $PARENT_DIR/`basename $0`"
  cron_temp_file=$(mktemp)
  crontab -l > "$cron_temp_file"
  if grep -Fx "$CRON_JOB" "$cron_temp_file"; then
    echo "Cron job already installed."
  else
    echo "$CRON_JOB" >> "$cron_temp_file"
    crontab "$cron_temp_file"
  fi
  rm "$cron_temp_file"
  exit 0
fi

inet=$(ip a | grep inet)"
`hostname`"
if [[ "$inet" != $(cat "$file") ]]; then
  echo "$inet" > "$file"
  curl -X POST -H 'Content-type: applicaion/json' --data '{"text":"'"$inet"'"}' $(cat "$webhookfile")
else
  echo "No change in IP address since last check."
fi
