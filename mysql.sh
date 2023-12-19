#!/usr/bin/env bash
#install msqyl

sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
sudo systemctl start mysql
sudo systemctl status mysql
sudo systemctl enable mysql
