#!/bin/bash

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh epel-release-7-5.noarch.rpm
yum -y update
yum -y install redis
systemctl start redis.service

sed -i "45s/6379/1234/" /etc/redis.conf

sed -i "64s/^/#/" /etc/redis.conf



sed -i "206s/<masterip>/127.0.0.1/" /etc/redis.conf
sed -i "206s/<masterport>/1234/" /etc/redis.conf

systemctl restart redis.service
