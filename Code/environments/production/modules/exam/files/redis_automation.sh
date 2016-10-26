#!/bin/bash

yum -y update
yum -y install epel-release
yum -y install redis
systemctl start redis.service

sed -i "45s/6379/1234/" /etc/redis.conf

sed -i "64s/^/#/" /etc/redis.conf



sed -i "206s/<masterip>/127.0.0.1/" /etc/redis.conf
sed -i "206s/<masterport>/1234/" /etc/redis.conf

systemctl restart redis.service
