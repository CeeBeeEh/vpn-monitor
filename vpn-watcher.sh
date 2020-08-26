#!/bin/bash

MYIP=<your-ip>

while true; do
        CURRENT=`curl -s checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`
        if [ "$CURRENT" == "$MYIP" ]; then
                echo "IPs match, VPN is dead, restarting"
                killall openvpn
                sleep 5
                cd /home/<username>/
                sudo openvpn <config>.ovpn &
                sleep 10
        else
                echo "IP is different"
                sleep 5
        fi
done
