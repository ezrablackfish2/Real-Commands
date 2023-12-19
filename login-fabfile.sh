#!/usr/bin/env bash
# this is something

echo "eval $(ssh-agent)
      ssh-add ~/.ssh/school" >> ~/.bashrc
source ~/.bashrc
