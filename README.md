# Streamserver
Install nginx mariaDB php wordpress phpmyadmin

Only working with ubuntu 20.04 atm.

nginx with key generator for livestreaming.

keygenerator is located in /home/nginx


STEP ONE
-------------------------------------------------------
Run as root.

cd /root && git clone 'https://github.com/andreasviklund201/streamserver.git' && cd /root/streamserver/install/ && chmod +x ./install.sh && ./install.sh


STEP TWO
-------------------------------------------------------
Setup mysql server with database, user and password.

mysql

CREATE DATABASE wordpress;

CREATE USER changeme@localhost IDENTIFIED BY 'PASSWORD';

GRANT ALL PRIVILEGES ON wordpress.* TO CHANGEME@localhost;

FLUSH PRIVILEGES;

EXIT


STEP THREE
-------------------------------------------------------
Secure the site with ssl encryption.

certbot --nginx -d example.com -d www.example.com
