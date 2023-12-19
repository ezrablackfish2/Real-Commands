#!/usr/bin/env bash
# Set MySQL commands as a string

MYSQL_COMMANDS=$(cat <<EOF
CREATE USER 'replica_user'@'%' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION SLAVE ON *.* TO "replica_user"@"%";
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR "replica_user"@"%";
SHOW GRANTS FOR 'holberton_user'@'localhost';
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
