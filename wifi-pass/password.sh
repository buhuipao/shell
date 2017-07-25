#!/bin/bash
#env: Fedora 23
#file: wifi-password.sh

if [ $UID -ne 0 ]; then
    echo "Usage: Please run as root this time"
    exit 0
fi
if [ $# -eq 0 ]; then
    iwconfig > wifi.txt
    clear
    #Get the WIFI name that you are connected'
    wifi_name=`grep ESSID wifi.txt | cut -d "\"" -f 2`
    echo -e "You are connected \e[1;32m$wifi_name\e[0m"
    rm -f wifi.txt
else
    wifi_name=$1
fi
str=`cut /etc/sysconfig/network-scripts/keys-$wifi_name -d "'" -f 2 `
echo -e "Wifi $wifi_name's password is \e[1;32m$str\e[0m"
echo -e "If you want to know other WiFi password,run like this: \e[1;34m./password.sh wifi_name!\e[0m"
