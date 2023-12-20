#!/usr/bin/env bash
# Set MySQL commands as a string

sudo echo "
log_bin                 = /var/log/mysql/mysql-bin.log
server-id               = 2
binlog_do_db            = tyrell_corp
relay-log = /var/log/mysql/mysql-relay-bin.log
" >> /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart
sudo service mysql status

MYSQL_COMMANDS=$(cat <<EOF
CHANGE MASTER TO MASTER_HOST='100.27.5.198', MASTER_USER='replica_user', MASTER_PASSWORD='projectcorrection280hbtn', MASTER_LOG_FILE='mysql-bin.000002', MASTER_LOG_POS='157';
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
