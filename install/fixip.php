#!/usr/bin/php
<?php

$ip_address = trim(`ip address | grep inet | grep brd | cut -d' ' -f6 | cut -d'/' -f1`);

$files_to_modify = array(
  '/etc/nginx/sites-available/streamer.conf',
);

foreach ($files_to_modify as $filename) {
  $c = file_get_contents($filename);
  $c = str_replace('changeme',$ip_address,$c);
  file_put_contents($filename,$c);
}