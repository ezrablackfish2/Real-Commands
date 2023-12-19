#!/usr/bin/env bash
# Installs and setup haproxy

apt-get install -y software-properties-common
add-apt-repository -y ppa:vbernat/haproxy-2.8
apt-get -y update
apt-get install -y haproxy

echo "ENABLED=1" > /etc/default/haproxy

# Listen to web1 and web2 servers                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
echo "
   listen load_balancer
   bind *:80
   mode http
   balance roundrobin
   option httpclose
   option forwardfor
   server 56172-web-01 54.146.13.194:80 check
   server 56172-web-02 107.23.87.158:80 check
" >> /etc/haproxy/haproxy.cfg

service haproxy start
