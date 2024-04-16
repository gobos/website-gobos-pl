#!/bin/bash

/usr/bin/rsync -e "ssh -i /home/grzegorzs/.ssh/id_rsa_instar_rsync -o StrictHostKeyChecking=no" -avu --exclude .git deployment@10.0.1.5:/home/deployment/gitlab/development/scripts/ ./cron/;crontab ~/cron/cron >/dev/null 2>&1
