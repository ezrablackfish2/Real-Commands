#!/usr/bin/env bash
#install msqyl

sudo apt-get update
sudo apt-get install mysql-server
sudo systemctl start mysql
mysql -u root -p
