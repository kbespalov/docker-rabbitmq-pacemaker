#!/bin/bash

output_file="/messaging/server_${topic}_${server}.json"
configuration_file="/messaging/simulator.ini"

echo "Dumping statistics to the $output_file"

python /messaging/simulator.py \
             --json $output_file \
             --config-file $configuration_file \
             -tp "topic_$topic" -s "server_$server" \
             rpc-server

python /messaging/collector.py -f $output_file -t "failover"

echo "Done!"
timestamp=$(date +%s)
echo "Client is done!"
