#!/usr/bin/env bash
#install nginx

sudo useradd -r nginx
echo "nginx    ALL=(ALL:ALL) ALL" >> /etc/sudoers
sudo chown -R nginx /etc/nginx
sudo chown -R nginx /var/
#sudo mkdir -p /run/nginx
sudo chown -R nginx /run/nginx

#sudo mkdir /run/pid
#sudo sed -i 's|pid /run/nginx.pid;|pid /run/pid/nginx.pid;|g' /etc/nginx/nginx.conf
#sudo chown -R nginx /run/pid
sed -i 's/^user .*;/user nginx;/g' /etc/nginx/nginx.conf
sudo chmod 644 /etc/nginx/nginx.conf
sudo sed -i '/\[Service\]/a User=nginx\nGroup=nginx' /lib/systemd/system/nginx.service
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
sudo touch /run/nginx.pid
sudo chown nginx:nginx /run/nginx.pid
sudo chmod 644 /run/nginx.pid




systemctl daemon-reload
service nginx restart
service nginx status
