#!/bin/bash

until /home/<username>/vpn-monitor.sh; do
    echo "VPN watcher has died, restarting" >&2
    sleep 5
done
