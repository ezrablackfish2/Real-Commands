#!/usr/bin/env bash
#install msqyl

sudo mysql -u root -p
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGS;
SHOW GRANTS FOR 'holberton_user'@'localhost';
exit;

