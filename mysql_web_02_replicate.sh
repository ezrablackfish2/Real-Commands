#!/usr/bin/env bash
# Set MySQL commands as a string

sudo echo "log_bin = /var/log/mysql/mysql-bin.log
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
binlog_db = tyrell_corp" >> /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart
sudo service mysql status

MYSQL_COMMANDS=$(cat <<EOF
CHANGE MASTER TO MASTER_HOST='100.27.5.198', MASTER_USER='replica_user', MASTER_PASSWORD='tutu@12345', MASTER_LOG_FILE='', MASTER_LOG_POS='';
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
