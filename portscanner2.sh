#!/bin/bash

hostrange=$1
port=$2

echo "Host            Port"
echo "------------------------"
for host in {1..254}; do
	ipaddr=$hostrange.$host
	timeout .1 bash -c "echo >/dev/tcp/$ipaddr/$port" 2>/dev/null && echo "Host: $ipaddr Port: $port" | tee -a scan.txt

done

