systemctl stop swgemu
ip=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
mysql -e "UPDATE swgemu.galaxy SET address='$ip';"
systemctl start swgemu;

