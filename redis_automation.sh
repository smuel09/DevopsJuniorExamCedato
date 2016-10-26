#!/bin/bash

#Downloading and installin Redis

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo rpm -ivh epel-release-7-5.noarch.rpm
sudo yum -y update
sudo yum -y install redis 
sudo systemctl start redis.service

#configuring master port
sed -i "45s/6379/1234/" /root/redis.conf.test

#Allowing traffic fro anywere to master

sed -i "64s/^/#/" /root/redis.conf.test



#Configure slave to master
sed -i "206s/<masterip>/127.0.0.1/" /root/redis.conf.test
sed -i "206s/<masterport>/1234/" /root/redis.conf.test

#Updating changes
sudo systemctl restart redis.service


