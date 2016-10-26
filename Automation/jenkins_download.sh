#!/bin/bash

#Downloadind and installing jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum -y install jenkins
sudo /etc/init.d/jenkins restart
systemctl restart jenkins.service
