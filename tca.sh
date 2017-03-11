#!/bin/bash
# new comment
CASE=$1
DATE=$(date +%Y%m%d%H%M)
LOG=~/redhat/scripts/cases.log

echo "$DATE: $CASE - new case taken" >> $LOG
redhat-support-tool getcase $1 | less
