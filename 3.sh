#!/usr/bin/env bash
#install nginx

sudo su
sudo useradd -r nginx
sudo chown -R nginx /etc/nginx



sed -i "s/#user www-data/user nginx/" /etc/nginx/nginx.conf
chmod 644 /etc/nginx/nginx.conf
sed -i 's/^User=.*$/User=nginx/g' /lib/systemd/system/nginx.service
sed -i 's/^Group=.*$/Group=nginx/g' /lib/systemd/system/nginx.service
if ! grep -q "^User=nginx" /lib/systemd/system/nginx.service; then
	    echo "User=nginx" >> /lib/systemd/system/nginx.service
fi

if ! grep -q "^Group=nginx" /lib/systemd/system/nginx.service; then
	    echo "Group=nginx" >> /lib/systemd/system/nginx.service
fi
sudo setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx
sudo apt-get install authbind   # For Debian/Ubuntu
sudo touch /etc/authbind/byport/80
sudo chown nginx /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80



systemctl daemon-reload
service nginx restart

