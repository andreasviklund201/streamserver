#!/bin/bash
apt-get -y install `cat package.php`
mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
systemctl enable nginx
systemctl restart nginx
echo 'Install completed, check the README for next steps'
