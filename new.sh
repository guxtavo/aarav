#!/bin/bash
# new comment
CASE=$1
DATE=$(date +%Y%m%d%H%M)
LOG=~/redhat/scripts/cases.log

echo "$DATE: $CASE - attachments downloaded" >> $LOG

mkdir ~/redhat/cases/$1
redhat-support-tool getattachment -c $1 -asm -d ~/redhat/cases/$1
