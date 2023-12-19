#!/usr/bin/env bash
# Installs and setup haproxy

sudo apt update
sudo apt install certbot
sudo systemctl stop nginx
sudo service haproxy stop
sudo certbot certonly --standalone -d www.hlb8qg2p9.tech -d hlb8qg2p9.tech
