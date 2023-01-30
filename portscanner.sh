#!/bin/bash

hostfile=$1
portfile=$2

echo "Host            Port"
for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "Host: $host Port: $port" | tee -a scan.txt
	done
done

