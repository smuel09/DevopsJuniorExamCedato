#!/bin/bash

yum -y install httpd

sed -i "151s/None/All" /etc/httpd/conf/httpd.conf

echo "ServerTokens Prod" >>  /etc/httpd/conf/httpd.conf
echo "KeepAlive On" >>  /etc/httpd/conf/httpd.conf


systemctl start httpd
systemctl enable httpd

cat <<EOT >> /etc/httpd/conf.d/auth_basic.conf
<Directory /var/www/html/auth-basic>
   AuthType Basic
   AuthName "Basic Authentication"
   AuthUserFile "/etc/httpd/conf/.htpasswd
   require valid-user
</Directory>
EOT

htpasswd -c -b /etc/httpd/conf/.htpasswd username password

systemctl restart httpd

