#!/usr/bin/env bash
#install nginx

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
service nginx restart

