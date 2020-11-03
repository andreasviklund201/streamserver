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
add-apt-repository ppa:certbot/certbot

echo 'Install completed, installing SSL'

certbot --nginx -d matforsonline.se -d www.matforsonline.se
