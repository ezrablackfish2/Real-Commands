#!/usr/bin/env bash
# Set MySQL commands as a string

MYSQL_COMMANDS=$(cat <<EOF
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'holberton_user'@'localhost';
exit;
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
