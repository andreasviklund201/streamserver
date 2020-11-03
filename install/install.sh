#!/bin/bash
apt-get -y install `cat package.txt`
mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
systemctl enable nginx
systemctl restart nginx
add-apt-repository -y ppa:certbot/certbot
mkdir /root/install/wordpress
cd /root/install/wordpress
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
cp -r /var/www/wordpress/* /var/www/html
echo 'Install completed, installing SSL'
