#!/bin/bash

mkdir -p cfg

cat reignited.cfg | jq '.["machine-config"]' > cfg/instance-config.json
cat reignited.cfg | jq '.drives[0]' > cfg/drives.json

cat reignited.cfg | jq '.["network-interfaces"][0]' > cfg/network_interfaces.eth0.json
cat reignited.cfg | jq '.["network-interfaces"][1]' > cfg/network_interfaces.eth1.json

cat reignited.cfg | jq '.["boot-source"]' > cfg/boot-source.json

cat reignited.mmds | jq -r '.["meta-data"]' | base64 -d > cfg/metadata.yaml
cat reignited.mmds | jq -r '.["user-data"]' | base64 -d > cfg/userdata.yaml



