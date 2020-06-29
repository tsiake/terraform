#!/bin/bash
yum install nginx -y
systemctl start nginx
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
systemctl enable nginx

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"  --enable "rhel-ha-for-rhel-*-server-rpms"
yum install certbot python2-certbot-nginx -y
certbot --nginx
echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null
