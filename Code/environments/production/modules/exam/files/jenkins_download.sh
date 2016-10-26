#!/bin/bash

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum -y install jenkins


/etc/init.d/jenkins start
systemctl restart jenkins.service

