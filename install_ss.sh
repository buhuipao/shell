#!/bin/bash
apt-get install -y supervisor python-pip
pip install --upgrade setuptools
pip  install wheel
pip  install gevent shadowsocks
echo 3 > /proc/sys/net/ipv4/tcp_fastopen
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
mkdir ss && cd ss && echo '{
	"server":"0.0.0.0",
	"port_password":{
	"8081":"ss_buhuipao",
	"8082":"ss_buhuipao"

},
"timeout":300,
"method":"RC4-MD5",
"fast_open":true,
"workers":2

}' > ssserver.json

echo '[program:ssserver]
directory = /root/ss ;
command = ssserver -c ssserver.json  ;
autostart = true     ;
startsecs = 5        ;
autorestart = true   ;
startretries = 3     ;
user = root ;
redirect_stderr = true  ;
stdout_logfile_maxbytes = 20MB  ;
stdout_logfile_backups = 50     ;
stdout_logfile = /var/log/ssserver.log  ;' > /etc/supervisor/conf.d/ssserver.conf
mv ../install_ss.sh .
