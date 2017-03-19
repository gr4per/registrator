#!/bin/sh
HOSTIP=$(cat /consul/agent-config.json | grep -o -e '\"[^,]*\"' | grep 'advertise_addr' | grep -o '[^ \"]*' | grep -v 'advertise_addr' | grep -v ':')
#REG_HOST_NAME=$(cat /consul/agent-config.json | grep -o -e '\"[^,]*\"' | grep 'node_name' | grep -o '[^ \"]*' | grep -v 'node_name' | grep -v ':')
#hostname $REG_HOST_NAME
#echo "testHostName" > /etc/hosts
echo "hostname =$(hostname)"
echo "host ip=$HOSTIP"
echo "starting registrator with -ip=\"$HOSTIP\" $@ consul://$HOSTIP:8500"
/bin/registrator -ip="$HOSTIP" $@ consul://$HOSTIP:8500
