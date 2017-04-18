#!/bin/bash

function generate_targets {
  declare -a targets
  for (( i=1; i <= $topics; i++ )) do
    for (( j=1; j <= $servers; j++ )) do
       targets+=("topic_$i.server_$j")
    done
  done
  echo ${targets[@]}
}
echo $(generate_targets)

python ./messaging/simulator.py \
        --json ./messaging/client.json \
        -tg $(generate_targets) \
        --config-file /messaging/simulator.ini rpc-client \
        -p $threads -m $messages --sync call --timeout $timeout

echo "Client is done!"
timestamp=$(date +%s)
