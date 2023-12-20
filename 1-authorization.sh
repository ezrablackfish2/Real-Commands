#!/usr/bin/env bash
# this iss to copy

sudo cat ./ssh-pub-key > ~/.ssh/authorized_keys
sudo cat ./ssh-pub-key > /home/ubuntu/.ssh/authorized_keys
sudo chmod 700 /home/ubuntu/.ssh
sudo chmod 600 /home/ubuntu/.ssh/authorized_keys
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys
sudo service sshd restart
