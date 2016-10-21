#!/bin/bash

#install Apache
yum -y install httpd
#Configuring httpd.conf.test
sed -i "151s/None/All/" /root/httpd.conf.test
#Appending necessary confugurations
echo "# server's response header" >> /root/httpd.conf.test
echo "ServerTokens Prod" >> /root/httpd.conf.test
echo "#keepalive is ON" >> /root/httpd.conf.test
echo "KeepAlive On" >> /root/httpd.conf.test

#Starting service
systemctl start httpd
systemctl enable httpd

#Creating New Authentication file
cat <<EOT >> /etc/httpd/conf.d/auth_basic.conf
<Directory /var/www/html/auth-basic>
    AuthType Basic
    AuthName "Basic Authentication"
    AuthUserFile /etc/httpd/conf/.htpasswd
    require valid-user
</Directory> 
EOT

#Creating Password file
htpasswd -c -b /etc/httpd/conf/.htpasswd username password 

#Restarting HTTP service
systemctl restart http



