#!/usr/bin/env bash

rootPath="$HOME/MEGAsync/Backups/cron-backups/github-backups"
zipName="GitRepo-Backup_$(date +'%Y-wk%V').zip"
zipPath="$rootPath/$zipName"
excludeZip='*.zip'

find "$rootPath" -mindepth 1 -type d ! -name "$excludeZip" -execdir zip -r "$zipPath" {} \; -exec rm -rf {} \;
