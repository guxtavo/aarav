# list the devices
DEV=`awk '/DEV/,/^$/' ./sos_commands/sar/sar15  | egrep -v "Average|^$" | awk '{print $2}' | sort | uniq | grep dev[67]`


for i in $DEV 
do
  echo -n $i " "
  grep $i ./sos_commands/sar/sar15 | awk '{ sum += $3 } END { print sum }'
done
