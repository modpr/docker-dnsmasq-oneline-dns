#!/bin/bash

ConfigFile=/etc/dnsmasq.conf

echo 'port=53' > $ConfigFile
echo "address=$DNSMASQ_ENTRY" >> $ConfigFile

exec /usr/sbin/dnsmasq --no-daemon
