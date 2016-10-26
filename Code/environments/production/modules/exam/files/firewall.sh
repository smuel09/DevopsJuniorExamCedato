#!/bin/bash
yum -y install iptables-services


iptables -A INPUT -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -m state --state RELATED -j ACCEPT

iptables -A INPUT -p tcp -s 46.116.212.88/32 --dport 35 -j ACCEPT

iptables -A INPUT -p tcp --dport 35 -j DROP

/sbin/service iptables save


