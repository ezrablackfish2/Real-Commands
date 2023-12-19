#!/usr/bin/env bash
# Set MySQL commands as a string

MYSQL_COMMANDS=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS nexus6 ( id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR (255) );
INSERT INTO nexus6 (name) VALUES ('leon');
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
USE tyrell_corp;
SELECT * FROM nexus6;
SHOW GRANTS FOR 'holberton_user'@'localhost';
EOF
)

# Pipe the MySQL commands to the MySQL command line
echo "${MYSQL_COMMANDS}" | sudo mysql -u root -p
