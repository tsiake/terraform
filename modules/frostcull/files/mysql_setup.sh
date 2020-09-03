#!/bin/bash

# install mysql community release
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm

# install mysql
yum install mysql-server -y
systemctl enable mysqld
systemctl start mysqld

# mysql hardening / setup

  MYSQL_ROOT_PASSWORD=$1
  MYSQL=$2

  SECURE_MYSQL=$(expect -c "

  set timeout 10
  spawn mysql_secure_installation

  expect \"Enter password for user root:\"
  send \"$MYSQL\r\"
  expect \"New password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Re-enter new password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Change the password for root ?\ ((Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  send \"$MYSQL\r\"
  expect \"New password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Re-enter new password:\"
  send \"$MYSQL_ROOT_PASSWORD\r\"
  expect \"Do you wish to continue with the password provided?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Remove anonymous users?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Disallow root login remotely?\(Press y\|Y for Yes, any other key for No) :\"
  send \"n\r\"
  expect \"Remove test database and access to it?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect \"Reload privilege tables now?\(Press y\|Y for Yes, any other key for No) :\"
  send \"y\r\"
  expect eof
  ")

  echo $SECURE_MYSQL

# end MySQL setup
