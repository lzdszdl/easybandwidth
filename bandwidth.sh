#!/bin/bash
MAX="11000"
A=`/sbin/iptables -n -v -L -t filter |grep -i --color -B 3 spt:8080|awk -F' ' '{print $7}'`
B=`echo ${A%o*}`
echo $B > /root/bandwidth.txt
C=`echo ${B%M*}`
if [ $C -gt $MAX ]; then
  /etc/init.d/shadowsocks stop
 # iptables -D OUTPUT -s 127.0.0.1 -p tcp --sport $PORT
 fi
#MAX=最大流量，单位M 本实例为监控8080端口流量，超出流量则结束某进程

#第一次使用请先执行 iptables -I OUTPUT -s 127.0.0.1 -p tcp --sport 8080
