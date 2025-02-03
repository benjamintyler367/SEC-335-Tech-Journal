#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <network-prefix> <port>"
    echo "Example: $0 192.168.1 80"
    exit 1
fi

network=$1
port=$2

echo "Scanning network $network.* on port $port"

for ip in {1..254}; do
    host="$network.$ip"
    if timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
        echo "$host:$port - OPEN"
    fi
done

