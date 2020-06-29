#!/bin/bash
yum update -y
yum install httpd -y
cp /home/web/upload/index.html /var/www/html
chmod 644 /var/www/html/index.html
systemctl enable httpd
systemctl start httpd
