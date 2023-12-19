#!/usr/bin/env bash
# Installs and setup haproxy

sudo apt update
sudo apt install certbot
sudo systemctl stop nginx
sudo service haproxy stop
sudo certbot certonly --standalone -d hlb8qg2p9.tech -d www.hlb8qg2p9.tech  
cat /etc/letsencrypt/live/hlb8qg2p9.tech/privkey.pem >> /etc/letsencrypt/live/hlb8qg2p9.tech/fullchain.pem
rm /etc/haproxy/haproxy.cfg
touch /etc/haproxy/haproxy.cfg
cat ./haproxy >> etc/haproxy/haproxy.cfg
