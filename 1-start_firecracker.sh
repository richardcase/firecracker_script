#!/bin/bash

mkdir -p out

log_file=$(pwd)/out/firercaker.log
touch $log_file

sudo $FIRECRACKER --api-sock $FIRECRACKER_SOCKET --log-path $log_file --level Debug