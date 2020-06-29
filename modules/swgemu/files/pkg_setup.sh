#!/bin/bash
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# clean yum / update
yum clean all && yum upgrade -y && yum update -y

# install important stuff
yum install automake make cmake git gcc gcc-c++ java-1.8.0-openjdk-headless libatomic libdb-devel make mariadb mariadb-devel openssl-devel wget yum-utils vim -y

# install lua 5.3 & needed prereq
yum install readline-devel -y
yum groupinstall "Development Tools" readline -y
mkdir lua_build
cd lua_build
curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
tar -zxf lua-5.3.4.tar.gz
cd lua-5.3.4
make linux
sudo make install

# Install cmake3, mirrors aren't finding cmake above 3.1
wget https://github.com/Kitware/CMake/releases/download/v3.18.0-rc2/cmake-3.18.0-rc2-Linux-x86_64.sh

bash cmake-3.18.0-rc2-Linux-x86_64.sh --skip-license

# Move the cmake folders to appropriate loc
mv /tmp/bin/* /usr/local/bin/
mv /tmp/doc/* /usr/local/doc/
mv /tmp/share/* /usr/local/share/

# Install latest devtoolset - need to fix SCL - it opens a new shell and stop execution....
yum install centos-release-scl -y
yum install devtoolset-7-gcc* -y
echo "scl enable devtoolset-7 bash" >> ~/.bash_profile
source ~/.bash_profile

