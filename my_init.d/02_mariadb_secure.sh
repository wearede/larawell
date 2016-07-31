#!/bin/bash

if [[ ! -f /var/lib/mysql/status.secured ]]; then
  echo "MariaDB -> secure"
  #
  /usr/sbin/service mysql start
  while [[ "$(/usr/bin/mysql -B -N -u root -e "select 1")" != 1 ]]; do
    sleep 1
  done
  sleep 3
  #
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "UPDATE mysql.user SET Password=PASSWORD('$MARIA_ROOT_PASSWORD') WHERE User='root'"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "DELETE FROM mysql.user WHERE User=''"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "FLUSH PRIVILEGES"
  touch /var/lib/mysql/status.secured
  #
  /usr/sbin/service mysql stop
  while [[ "$(/usr/bin/pgrep mysql | /usr/bin/wc -l)" != 0 ]]; do
    sleep 1
  done
  sleep 3
  echo "MariaDB -> secured"
fi
