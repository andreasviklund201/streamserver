#!/bin/bash
sudo apt-get -y install `cat package.txt`
sudo mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
sudo tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
sudo mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
sudo systemctl enable nginx
sudo systemctl restart nginx
echo 'Install completed, check the README for next steps'
