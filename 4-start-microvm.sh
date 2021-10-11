#!/bin/bash

socket=$FIRECRACKER_SOCKET

curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/actions' --data-binary "@instance-start.json"

