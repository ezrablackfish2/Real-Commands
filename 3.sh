#!/usr/bin/env bash
#install nginx

sudo useradd -r nginx
sudo chown -R nginx /etc/nginx



sed -i 's/^user .*;/user nginx;/g' /etc/nginx/nginx.conf
sudo chmod 644 /etc/nginx/nginx.conf
sudo sed -i 's/^User=.*$/User=nginx/g' /lib/systemd/system/nginx.service
sudo sed -i 's/^Group=.*$/Group=nginx/g' /lib/systemd/system/nginx.service
if ! grep -q "^User=nginx" /lib/systemd/system/nginx.service; then
	    sudo echo "User=nginx" >> /lib/systemd/system/nginx.service
fi

if ! grep -q "^Group=nginx" /lib/systemd/system/nginx.service; then
	    sudo echo "Group=nginx" >> /lib/systemd/system/nginx.service
fi
sudo setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx
sudo apt-get install authbind   # For Debian/Ubuntu
sudo touch /etc/authbind/byport/80
sudo chown nginx /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80



systemctl daemon-reload
service nginx restart

