#!/bin/bash
apt-get -y install `cat package.txt`
chmod +x fixip.php
./fixip.php
mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
add-apt-repository -y ppa:certbot/certbot
systemctl enable nginx
systemctl restart nginx
mkdir /root/install/wordpress
cd /root/install/wordpress
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
cp -r /var/www/wordpress/* /var/www/html
clear
echo
echo
echo 'Install completed, remember to create database for wordpress'
echo
echo
echo 'Edit /etc/nginx/sites-available/streamer.conf with your domain'
echo
echo