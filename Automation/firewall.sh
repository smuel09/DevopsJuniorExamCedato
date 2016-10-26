#!/bin/bash
#
# iptables example configuration script
#
# Flush all current rules from iptables
#
#
# Allow SSH connections on tcp port 22
# This is essential when working on remote servers via SSH to prevent locking yourself out of the system
#
 iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#
#
# Set access for localhost
#
 iptables -A INPUT -i lo -j ACCEPT
#
# Accept packets belonging to established and related connections
#
 iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#
#Accept traffic to port 25 from 46.116.212.88/32
 iptables -A INPUT -p tcp -s 46.116.212.88/32 --dport 35 -j ACCEPT 
#
# Dropping all traffic to port 25
 iptables -A INPUT -p tcp --dport 25 -j DROP

# Save settings
#
 /sbin/service iptables save
#
# List rules
#
 iptables -L -v
