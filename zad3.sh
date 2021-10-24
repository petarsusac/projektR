#! /bin/bash

ip_adr=$1
port=$2

if nc -z $ip_adr $port ; then
    echo "Port is open."
else
    echo "Port is not open."
fi