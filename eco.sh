#!/bin/bash
# edit comment
CASE=$(pwd|cut -f 6 -d "/")
OLD=$(ls -tr ~/redhat/comments/${CASE}*|tail -1)
LOG=~/redhat/scripts/cases.log
DATE=$(date +%Y%m%d%H%M) 

echo "$DATE: $CASE - comment edited" >> $LOG
echo $OLD
vim $OLD
