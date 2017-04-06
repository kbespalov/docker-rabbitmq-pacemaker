#!bin/bash

#systemctl enable pcsd
#service pcsd start
service corosync restart
service pacemaker start
service rabbitmq-server restart

crm configure property no-quorum-policy=ignore
crm configure property stonith-enabled=false

crm configure primitive rmq lsb:rabbitmq-server
crm configure primitive ip_rmq ocf:heartbeat:IPaddr2 params ip="172.23.0.11" nic="eth0" clone cl_rmq p_rmq clone-max="3"  globally-unique="false"

# pcs cluster auth -u hacluster -p r00tme 172.23.0.6 172.23.0.7 72.23.0.8
# pcs cluster setup --start --name rabbitmq 172.23.0.6 172.23.0.7 172.23.0.8 --force

corosync-cmapctl | grep members

echo "" > /var/log/corosync/corosync.log
tail -f /var/log/corosync/corosync.log
