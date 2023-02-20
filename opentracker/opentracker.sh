#!/usr/bin/env sh

cd /home/WHOAMI/opentracker_w/ && \
    rm whitelist.list && \
    wget https://raw.githubusercontent.com/smoxy/generic/main/opentracker/whitelist.list &> /dev/null

kill -s 1 $(pidof opentracker)

### Avvio delegato a crontab:
##@reboot screen -S opentracker -d -m opentracker -f /home/WHOAMI/opentracker_w/opentracker.conf -w /home/WHOAMI/opentracker_w/whitelist.list
##*/15 * * * * sh /home/WHOAMI/opentracker_w/opentracker.sh

### Alternativa al kill SIGHUP
##screen -X -S opentracker quit && \
##    screen -S opentracker -d -m opentracker -f /home/WHOAMI/opentracker_w/opentracker.conf -w /home/WHOAMI/opentracker_w/whitelist.list
