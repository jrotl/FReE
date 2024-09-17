#!/bin/bash

LABEL=""

BACKUP_FILE="$HOME/backup_${LABEL}_$(date +%Y%m%d%H%M).tar.gz"

find $HOME -type f -not -path '*/.*' -mmin -5 -exec tar -czf "$BACKUP_FILE" {} +

# https://dlptest.com/ftp-test/
FTP_HOST=""
FTP_USER=""
FTP_PASS=""

curl -T "$BACKUP_FILE" ftp://$FTP_USER:$FTP_PASS@$FTP_HOST/

rm "$BACKUP_FILE"
