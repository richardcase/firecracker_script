#!/bin/bash

socket=$FIRECRACKER_SOCKET

sudo chmod 666 $socket

curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/machine-config' --data-binary "@cfg/instance-config.json"


curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/drives/root' --data-binary "@cfg/drives.json"


curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/network-interfaces/eth0' --data-binary "@cfg/network_interfaces.eth0.json"

curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/network-interfaces/eth1' --data-binary "@cfg/network_interfaces.eth1.json"


curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/boot-source' --data-binary "@cfg/boot-source.json"

