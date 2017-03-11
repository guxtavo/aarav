#!/bin/bash
# copy last comment to clipboard
# broadcast comment in irc sbr-kernel-emeaedit comme
CASE=$(pwd|cut -f 6 -d "/")
OLD=$(ls -tr ~/redhat/comments/${CASE}*|tail -1)
LOG=~/redhat/scripts/cases.log
DATE=$(date +%Y%m%d%H%M) 


irc() {
    context=`dbus-send --dest=org.xchat.service --print-reply --type=method_call /org/xchat/Remote org.xchat.plugin.FindContext string:"Red Hat IRC" string:"" | tail -n1 | awk '{print $2}'`

    dbus-send --dest=org.xchat.service --type=method_call /org/xchat/Remote org.xchat.plugin.SetContext uint32:$context

    dbus-send --dest=org.xchat.service --type=method_call /org/xchat/Remote org.xchat.plugin.Command string:"msg #emea-sbr-kernel New update for case $CASE"
}

main() {
  echo $OLD
  aspell -c $OLD
  cat $OLD|xsel
  #irc
  echo "Paste comment on ticketing system"
  echo "$DATE: $CASE - new comment published" >> $LOG
}

main
