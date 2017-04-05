#!bin/bash

# disable quorum-related messages in the logs
pcs property set no-quorum-policy=ignore
pcs property set stonith-enabled=false
