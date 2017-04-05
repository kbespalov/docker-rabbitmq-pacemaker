#!bin/bash

#systemctl enable pcsd
#service pcsd start
service corosync restart
service pacemaker start

pcs cluster auth -u hacluster -p r00tme pm-1 pm-2 pm-3
pcs cluster setup --start --name rabbitmq pm-1 pm-2 pm-3 --force

corosync-cmapctl | grep members

echo "" > /var/log/corosync/corosync.log
tail -f /var/log/corosync/corosync.log
