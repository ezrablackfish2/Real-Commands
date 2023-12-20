#!/usr/bin/env bash
# this iss to copy

sudo cat ./ssh-pub-key > ~/.ssh/authorized_keys
sudo cat ./ssh-pub-key > /home/ubuntu/.ssh/authorized_keys
chmod 700 /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
