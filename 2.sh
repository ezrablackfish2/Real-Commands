#!/usr/bin/env bash
#install nginx

sudo sed -i 's/\bindex\.html\b/100-index.html/g' /etc/nginx/sites-enabled/default
sudo service nginx restart
