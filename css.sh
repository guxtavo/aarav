#!/bin/bash
# edit comment
CASE=$(pwd|cut -f 6 -d "/")
OLD=$(ls -tr ~/redhat/comments/${CASE}*|tail -1)
LOG=~/redhat/scripts/cases.log
PLOG=~/redhat/scripts/playbook.log
DATE=$(date +%Y%m%d%H%M) 

echo $OLD

# dialog menu
# answer will receive all codes and will be used to grep pb.db
# I tried making this menu more clear but when I use \ in eol dialog doesn't work
#  Check if $1 (case number) is not null

if -z $1
then
print_usage
exit 1
fi


#answer=$(dialog --stdout --checklist "Please select the Playbook items" 0 0 0 "BDS001" 'Basics - data - sosreport' off "BDP001" 'Basics - data - perf | oprofile | strace | stap' off "KPF001" 'Kernel - performance' off "KPI001" 'Kernel - performance - high io wait' off "KPL001" 'Kernel - performance - high load' off "KMM001" 'Kernel - memory management' off "KMF002" 'Kernel - memory management - memory full  | cache full' off "KPH001" 'Kernel - panics hungs' off "KBC001" 'Kernel - boot - cannot boot' off "KBU001" 'Kernel - boot - unexpected reboot' off "KVC001" 'Kernel - vmcore - how to collect vmcore - sysrq | tunables' off "KVC002" 'Kernel - vmcore - how to collect vmcore - vmware' off "KTO001" 'Kernel - tunning - oracle' off KTD001 'Kernel - tunning - database' off)

answer=$(dialog --stdout --checklist "Please select the Playbook items" 0 0 0 \
 "BDS001" 'Basics - data - sosreport' off \
 "BDP001" 'Basics - data - perf | oprofile | strace | stap' off \
 "KPF001" 'Kernel - performance' off \
 "KPI001" 'Kernel - performance - high io wait' off \
 "KPL001" 'Kernel - performance - high load' off "KMM001" 'Kernel - memory management' off \
 "KMM001" 'Kernel - memory management' off \
 "KMF002" 'Kernel - memory management - memory full  | cache full' off \
 "KBC001" 'Kernel - boot - cannot boot' off \
 "KPH001" 'Kernel - panics hungs' off \
 "KBU001" 'Kernel - boot - unexpected reboot' off \
 "KTO001" 'Kernel - tunning - oracle' off \
 "KTD001" 'Kernel - tunning - database' off)
 "KVC001" 'Kernel - vmcore - how to collect vmcore - sysrq | tunables' off \
 "KVC002" 'Kernel - vmcore - how to collect vmcore - vmware' off \
 "KIT001" 'Kernel - internals' off \
 "RSL001" 'RHEL - support and limits' off \
 "KCPU001" 'cpu management' off \
 "VMT001" 'vmware tools' off \
 "VMW001" 'vmware' off \
 "CLU001" 'clusterha' off \
 "SYDRHEL" 'systemd rhel7' off \
 "GRUB001" 'grub' off \
 "HYPERV001" 'hyperv' off \
 "CONS001" 'serial console' off \
 "CGRP001" 'cgroups' off \
 "CP001" 'customer portal' off \
 "KRHEL7001" 'RHEL7 kernels' off \
 "KRHEL6001" 'RHEL6 kernels' off)

# checking exit status or error will be printed if user cancels

exitstatus=$?
if [ $exitstatus = 0 ]; then
     clear


echo "$DATE: $CASE - running cssbot" >> $LOG

# printing header 

echo " ==============================================================================" >> $OLD
echo >> $OLD
echo " Please find here this case's Playbook. Please feel free to add any links to" >> $OLD
echo " the Playbook." >> $OLD
echo >> $OLD

  # greping answer in pb.db. Replacing space by pipe

     egrep -A 3 "${answer// /|}" ~/redhat/scripts/cssbot.txt | egrep -v ${answer// /|} >> $OLD

  # printing footer

echo " We higly recommend you to read all of them in case you have a severe problem." >> $OLD
echo " Our engineers will evaluate if those solutions are pertinent to the case or  " >> $OLD
echo " not." >> $OLD
echo >> $OLD
echo " ==============================================================================" >> $OLD

  # log choices

echo $CASE ${answer// /|} >> $PLOG

  # publish internal note to case

#redhat-support-tool addcomment -c $1

else
    clear
    echo "You chose Cancel."
fi

# "BDS001" 'Basics - data - sosreport' off \
# "BDP001" 'Basics - data - perf | oprofile | strace | stap' off \
# "KPF001" 'Kernel - performance' off \
# "KPI001" 'Kernel - performance - high io wait' off \
# "KPL001" 'Kernel - performance - high load' off "KMM001" 'Kernel - memory management' off \
# "KMM001" 'Kernel - memory management' off \
# "KMF002" 'Kernel - memory management - memory full  | cache full' off \
# "KBC001" 'Kernel - boot - cannot boot' off \
# "KPH001" 'Kernel - panics hungs' off \
# "KBU001" 'Kernel - boot - unexpected reboot' off \
# "KTO001" 'Kernel - tunning - oracle' off \
# "KTD001" 'Kernel - tunning - database' off)
# "KVC001" 'Kernel - vmcore - how to collect vmcore - sysrq | tunables' off \
# "KVC002" 'Kernel - vmcore - how to collect vmcore - vmware' off \
# "KIT001" 'Kernel - internals' off \
# "RSL001" 'RHEL - support and limits' off \
# "KCPU001" 'cpu management' off \
# "VMT001" 'vmware tools' off \
# "VMW001" 'vmware' off \
# "CLU001" 'clusterha' off \
# "SYDRHEL" 'systemd rhel7' off \
# "GRUB001" 'grub' off \
# "HYPERV001" 'hyperv' off \
# "CONS001" 'serial console' off \
# "CGRP001" 'cgroups' off \
# "CP001" 'customer portal' off \
# "KRHEL7001" 'RHEL7 kernels' off \
# "KRHEL6001" 'RHEL6 kernels' off \
