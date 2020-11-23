#!/bin/bash
apt-get -y install `cat package.txt`
mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
systemctl enable nginx
mkdir /root/install/wordpress
cd /root/install/wordpress
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
cp -r /var/www/wordpress/* /var/www/html
cd /root/streamserver/install/
php fixip.php
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
ln -s /usr/share/phpmyadmin /var/www/html
cp /home/nginx/php.ini /etc/php/7.4/fpm
echo ENABLE=1 >> /etc/default/stunnel4
cp /home/nginx/stunnel.conf /etc/stunnel/
/lib/systemd/systemd-sysv-install enable stunnel4
systemctl restart stunnel4.service
systemctl restart php7.4-fpm
systemctl restart nginx
clear
echo
echo		'######################################################################'
echo		'#'   'Install completed, remember to create database for wordpress' '#'
echo		'#'                                                                  '#'
echo		'#'                                                                  '#'
echo		'#''Edit /etc/nginx/sites-available/streamer.conf with your domain'  '#'
echo		'#'                                                                  '#'
echo		'######################################################################'