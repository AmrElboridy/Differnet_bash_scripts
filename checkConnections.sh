#!/bin/bash

# Define an array of server-port-hostname entries
declare -a connections=(
    "10.230.206.73 433 HQLIRMDWEB01 Midtier Server Integ 1"
    "10.230.206.74 433 HQLIRMDWEB02 Midtier Server Integ 2"
    "10.230.206.55 433 HQLIRMDWEB03 Midtier Server Integ 3"
    "10.179.9.136 50000 DCHQLIRMDAPP01 ARS App Server Integ 1"
    "10.179.9.137 50000 DCHQLIRMDAPP02 ARS App Server Integ 2"
    "10.179.9.138 50000 DCHQLIRMDAPP03 ARS App Server Integ 3"
    "10.179.8.37 50000 remedy-app-intg.internal.eg.vodafone.com LB APP INTEG"
    "10.230.208.40 433 remedy-web-intg.internal.eg.vodafone.com LB WEB INTEG"
)

# Iterate over each connection entry
for connection in "${connections[@]}"; do
    # Split the connection entry into separate variables
    read -r ip port hostname <<< "$connection"
    
    # Check the connection using telnet
    if telnet "$ip" "$port" >/dev/null 2>&1; then
        echo "Connection to $hostname ($ip:$port) is open"
    else
        echo "Connection to $hostname ($ip:$port) is closed"
    fi
done
