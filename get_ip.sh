#!/bin/sh

eth0=$([ -d /proc/sys/net/ipv4/conf/eth0 ] && echo "eth0: $({ ip -4 -br a sh dev eth0 | awk {'print $3'} | cut -f1 -d/; } 2>/dev/null)")

tun0=$([ -d /proc/sys/net/ipv4/conf/tun0 ] && echo "tun0: $({ ip -4 -br a sh dev tun0 | awk {'print $3'} | cut -f1 -d/; } 2>/dev/null)")

#echo "$eth0 | $tun0"


if ! [ -z "$eth0" ] && ! [ -z "$tun0" ]; then
        echo "$eth0 | $tun0"
elif [ -z "$tun0" ]; then
        echo $eth0
elif [ -z "$eth0" ]; then
        echo $tun0
fi
