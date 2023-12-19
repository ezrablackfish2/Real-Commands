#!/usr/bin/env bash
# this iss to copy

sudo mkdir /home/ubuntu/.ssh/
sudo cat ./ssh-pub-key > /home/ubuntu/.ssh/authorized_keys
