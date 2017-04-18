#!bin/bash

#systemctl enable pcsd
#service pcsd start
service corosync restart
service pacemaker start
service rabbitmq-server restart

crm configure property no-quorum-policy=ignore
crm configure property stonith-enabled=false

crm configure primitive rmq service:rabbitmq-server op monitor interval='10'
crm configure primitive ip_rmq ocf:heartbeat:IPaddr2 params ip="172.23.0.11" nic="eth0" op monitor interval='10'
crm configure colocation rmq_colocation INFINITY: ip_rmq rmq
crm configure clone rmq_clone rmq meta globally-unique=false clone-max=3

# pcs cluster auth -u hacluster -p r00tme 172.23.0.6 172.23.0.7 72.23.0.8
# pcs cluster setup --start --name rabbitmq 172.23.0.6 172.23.0.7 172.23.0.8 --force

corosync-cmapctl | grep members

echo "" > /var/log/corosync/corosync.log


rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

tail -f /var/log/corosync/corosync.log
