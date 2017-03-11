#!/bin/bash
# new comment
CASE=$(pwd|cut -f 6 -d "/")
DATE=$(date +%Y%m%d%H%M)
LOG=~/redhat/scripts/cases.log

echo "$DATE: $CASE - new attachment added" >> $LOG
echo ~/redhat/comments/${CASE}/$1
redhat-support-tool addattachment -c ${CASE} $1
