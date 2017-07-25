#!/bin/bash
# pptp.sh
#===================================================================
#   SYSTEM :  CentOS 7 (32bit/64bit)                               #
#   Author :  buhuipao.com                                         #
#===================================================================

if [[ $EUID -ne 0 ]]; then
    echo "Usage:Please Run As Root!"
    exit -1
fi

if [ ! -e /dev/net/tun ]; then
    echo "TUN/TAP is not available!"
    exit -1
fi

cur_dir=`pwd`
clear
echo ""
echo "-------------------------------------------------------------"
echo "| System : CentOS 7(32bit/64bit)                    |"
echo "| Additional: http://www.buhuipao.com/shell/vpn_pptp        |"
echo "| Author: chenhua22@outlook.com                             |"
echo "-------------------------------------------------------------"
echo ""

# Remove Old pptpd & ppp
yum remove -y pptpd ppp
iptables --flush POSTROUTING --table nat
iptables --flush FORWARD
rm -f /etc/pptpd.conf
rm -rf /etc/ppp

#Find IP of your VPS
IP=`ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | egrep -v "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\." | head -n 1`

yum  install net-tools make libpcap iptables gcc-c++ logrotate tar cpio perl pam tcp_wrappers dkms pppd ppp -y

rm -f /dev/ppp
mknod /dev/ppp c 108 0
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "mknod /dev/ppp c 108 0" >> /etc/rc.local
echo "echo 1 > /proc/sys/net/ipv4/ip_forward" >> /etc/rc.local
echo "localip 192.168.8.1" >> /etc/pptpd.conf
echo "remoteip 192.168.8.2-254" >> /etc/pptpd.conf
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd

pass='buhuipao.com'

echo "myvpn pptpd ${pass} *" >> /etc/ppp/chap-secrets

iptables -t nat -A POSTROUTING -s 192.168.8.0/24 -j SNAT --to-source ${IP}
iptables -A FORWARD -p tcp --syn -s 192.168.8.0/24 -j TCPMSS --set-mss 1356
service iptables save
systemctl enable pptpd
systemctl restart iptables 
systemctl start pptpd 

echo ""
echo "PPTP_VPN service is installed."
echo "ServerIP:${IP}"
echo "Username:myvpn"
echo "Password:${pass}"
echo "Add User: vim /etc/ppp/chap-secrets"
echo ""

exit 0
