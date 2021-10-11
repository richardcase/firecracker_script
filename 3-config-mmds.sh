#!/bin/bash

socket=$FIRECRACKER_SOCKET

metadata=$(cat cfg/metadata.yaml | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')
userdata=$(cat cfg/userdata.yaml | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')

cat <<EOF > cfg/meta-data.json
{
  "latest": {
    "meta-data": "${metadata}"
  }
}
EOF

cat <<EOF > cfg/user-data.json
{
  "latest": {
    "user-data": "${userdata}"
  }
}
EOF


curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PUT 'http://localhost/mmds' --data-binary "@cfg/meta-data.json"


curl --unix-socket $socket \
		-H 'Accept: application/json'	\
		-H 'Content-Type: application/json'	\
		-X PATCH 'http://localhost/mmds' --data-binary "@cfg/user-data.json"