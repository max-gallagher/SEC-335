#!/bin/bash

hostr=$1
dnsserver=$2


for host in {1..254}; do
	ipaddr=$hostr.$host
	nslookup $ipaddr  $dnsserver | grep "name"

done

