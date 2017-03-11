#!/bin/bash
# new comment
CASE=$(pwd|cut -f 6 -d "/")
DATE=$(date +%Y%m%d%H%M)
LOG=~/redhat/scripts/cases.log

echo "$DATE: $CASE - new comment created" >> $LOG
echo ~/redhat/comments/${CASE}_${DATE}.txt
vim ~/redhat/comments/${CASE}_${DATE}.txt
