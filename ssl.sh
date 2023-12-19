#!/usr/bin/env bash
# Installs and setup haproxy

sudo apt update
sudo apt install certbot
sudo systemctl stop nginx
sudo service haproxy stop
sudo certbot certonly --standalone -d hlb8qg2p9.tech -d www.hlb8qg2p9.tech  
sudo cat /etc/letsencrypt/live/hlb8qg2p9.tech/privkey.pem >> /etc/letsencrypt/live/hlb8qg2p9.tech/fullchain.pem
sudo rm /etc/haproxy/haproxy.cfg
sudo touch /etc/haproxy/haproxy.cfg
sudo cat ./haproxy >> /etc/haproxy/haproxy.cfg

sudo service haproxy restart
