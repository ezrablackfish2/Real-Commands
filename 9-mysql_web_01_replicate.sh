#!/usr/bin/env bash
# Set MySQL commands as a string

sudo echo "log_bin = /var/log/mysql/mysql-bin.log
server-id = 1">> /etc/mysql/mysql.conf.d/mysqld.cnf
sudo ufw allow 3306
sudo service mysql restart
sudo service mysql status

MYSQL_COMMANDS=$(cat <<EOF
SHOW MASTER STATUS;
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
