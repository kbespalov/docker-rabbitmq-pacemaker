#!bin/bash

# disable quorum-related messages in the logs
crm configure property no-quorum-policy=ignore
