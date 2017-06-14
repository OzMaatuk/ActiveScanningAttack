#!/bin/bash

DEV=wlx18d6c709b823

if [[ -f /run/dhcpcd-$DEV.pid ]]
then
        kill -QUIT $(cat /run/dhcpcd-$DEV.pid)
fi

ifconfig $DEV down
iw dev $DEV set type managed
ifconfig $DEV up
sleep 2

iw dev wlx18d6c709b823 connect -w 'Akond of Swat' 2462 5C:AC:4C:07:F5:7A key d:05055500550

sleep 15

dhcpcd -4 --nohook 10-wpa_supplicant --noarp --noipv6rs $DEV
