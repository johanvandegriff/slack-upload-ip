# Slack Upload IP

A cron job to upload the IP address of a computer to slack when it changes.

# Install
1. `cd`
2. `git clone https://gitlab.com/johanvandegriff/slack-upload-ip.git`
3. `cd slack-upload-ip`
4. `./slack-upload-ip.sh --setup`
5. Enter the webhook URL from your slack workspace. To create a webhook, see [this guide](https://api.slack.com/incoming-webhooks). The URL will look something like `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX`
6. The script has set up a cron job to run every 5 minutes to check if the IP address has changed, and if it has, send a message to slack. So you should get a message at the next increment of 5 minutes (on the hour, 5 past, 10 past, etc.).

# Uninstall
1. `crontab -e`
2. Remove the line that looks like: `*/5 * * * * /home/user/slack-upload-ip/slack-upload-ip.sh`
3. Save and exit.
4. You may remove the `~/slack-upload-ip` directory if you want.