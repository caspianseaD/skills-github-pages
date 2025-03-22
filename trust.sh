#!/bin/bash

# Define the port for the SOCKS5 proxy
SOCKS_PORT=1080

# Start the SOCKS5 proxy using SSH
echo "Starting SOCKS5 proxy on port $SOCKS_PORT..."
ssh -D $SOCKS_PORT -q -C -N -f user@your-remote-server.com

# Check if the proxy is running
if pgrep -f "ssh -D $SOCKS_PORT" > /dev/null; then
    echo "SOCKS5 proxy is running on port $SOCKS_PORT."
else
    echo "Failed to start SOCKS5 proxy."
    exit 1
fi

# Instructions for using the proxy
echo "You can now use the SOCKS5 proxy by configuring your application to use:"
echo "Proxy Host: 127.0.0.1"
echo "Proxy Port: $SOCKS_PORT"
