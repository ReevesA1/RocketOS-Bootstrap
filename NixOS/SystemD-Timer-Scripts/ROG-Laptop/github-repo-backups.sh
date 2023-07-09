#!/usr/bin/env bash

#____   ___   ____ _  _______ _____
#|  _ \ / _ \ / ___| |/ / ____|_   _|
#| |_) | | | | |   | ' /|  _|   | |
#|  _ <| |_| | |___| . \| |___  | |
#|_| \_\\___/ \____|_|\_\_____| |_|

# Script name:
# Date: 
# Description: 
# Dependencies: 
# License: 
# Contributors: 

#!I dont use cront tabs anymore
# Always use  "sudo crontab -u rocket -e" to Edit just crontab -e doesnt allways work
# Cronjob command below (make sure to remove the # - Run at 8AM and run at 6PM - Note will note run if pc is off or sleeping) 
#0 8 * * * $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh
#0 18 * * * $HOME/MEGAsync/Scripts/Crons/github-repo-backups.sh



################################################################
##                      stating  variables                    ##
################################################################
now=$(date '+%Y_%B_%d_%I%p')


################################################################
##                      Directory stuff                       ##
################################################################

mkdir $HOME/MEGAsync/Backups/cron-backups/github-backups/Github-Repos-$now

cd $HOME/MEGAsync/Backups/cron-backups/github-backups/Github-Repos-$now



################################################################
##                      repos                                 ##
################################################################


ghp_key="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"


###################Private################

git clone https://ReevesA1:$ghp_key@github.com/ReevesA1/OldStuff.git
sleep 5
git clone https://ReevesA1:$ghp_key@github.com/ReevesA1/ansible.git
sleep 5
git clone https://ReevesA1:$ghp_key@github.com/ReevesA1/RocketOS.git
sleep 5
git clone https://ReevesA1:$ghp_key@github.com/ReevesA1/Obsidian-Vault.git
sleep 5




###############Public####################

git clone https://github.com/ReevesA1/ansible-bootstrap.git
sleep 5

git clone https://github.com/ReevesA1/steamdeck-os.git
sleep 5

git clone https://github.com/ReevesA1/RocketOS-Bootstrap.git
sleep 5

############### Healthcheck.io Ping####################
# Sends an HTTP GET request with curl:
curl -m 10 --retry 5 https://hc-ping.com/a96c045c-700c-4170-964e-326ff6f0ec88
