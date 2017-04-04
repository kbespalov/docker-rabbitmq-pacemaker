#!bin/bash

service corosync restart
service pacemaker restart

corosync-cmapctl | grep members
echo "" > /var/log/corosync/corosync.log
tail -f /var/log/corosync/corosync.log
