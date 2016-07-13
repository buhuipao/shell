#!/bin/bash

echo '1'> /proc/sys/net/ipv4/tcp_syncookies
#modprobe ip_tables
#modprobe iptable_nat
#modprobe ip_nat_ftp
#modprobe ip_nat_irc
#modprobe ip_conntrack
#modprobe ip_conntrack_ftp
#modprobe ip_conntrack_irc
#modprobe ipt_MASQUERADE

iptables -P INPUT ACCEPT
iptables -F
iptables -X
iptables -Z
iptables -F -t nat
iptables -X -t nat
iptables -Z -t nat
iptables -X mangle

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT 
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT
#iptables -A INPUT -m state --state NEW -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -t nat -P PREROUTING ACCEPT
#iptables -t nat -P POSTROUTING ACCEPT
#iptables -t nat -P OUTPUT ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FROWRAD DROP

service iptables save
systemctl restart iptables.service
