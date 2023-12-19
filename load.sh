#!/usr/bin/env bash
# Installs and setup haproxy

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:vbernat/haproxy-2.8
sudo apt-get -y update
sudo apt-get install -y haproxy
sudo ufw disable


sudo echo "ENABLED=1" > /etc/default/haproxy

# Listen to web1 and web2 servers                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
sudo echo "
   listen load_balancer
   bind *:80
   mode http
   balance roundrobin
   option httpclose
   option forwardfor
   server 56172-web-01 18.210.14.227:80 check
   server 56172-web-02 107.23.87.158:80 check
" >> /etc/haproxy/haproxy.cfg

sudo service haproxy start
