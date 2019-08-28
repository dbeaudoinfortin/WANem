#!/bin/bash

#define your default

#ms
LATENCY=15
#in kbit
BANDWIDTH=50000


#Don't change any below, expect you know what your are doing.

#pause until interfaces are up 
INTERFACESUP=0
while [ $INTERFACESUP -lt 2 ]; do
        sleep 5
        INTERFACESUP=`ifconfig | grep UP,BROADCAST | wc -l`
done



#seems we need more time, even if the interfaces are up..
sleep 20


#set all interfaces; excluding any bridges (named as br..)
ifconfig | grep BROADCAST | awk -F: '{print $1;}' | grep -v br | while read -r line; do
        tc qdisc add dev $line root handle 1: netem delay ${LATENCY}ms
        tc qdisc add dev $line parent 1:1 handle 10: htb default 1 r2q 10
        tc class add dev $line parent 10: classid 0:1 htb rate ${BANDWIDTH}kbit ceil ${BANDWIDTH}kbit
done


