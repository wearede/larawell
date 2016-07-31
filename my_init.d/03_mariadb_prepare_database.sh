#!/bin/bash

if [[ ! -f /var/lib/mysql/status.prepared ]]; then
  echo "MariaDB -> prepare"
  #
  /usr/sbin/service mysql start
  while [[ "$(/usr/bin/mysql -B -N -u root -e "select 1")" != 1 ]]; do
    sleep 1
  done
  sleep 3
  #
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "CREATE DATABASE homestead"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "CREATE USER homestead@localhost IDENTIFIED BY 'secret'"
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON homestead.* TO homestead@localhost"
  touch /var/lib/mysql/status.prepared
  #
  /usr/sbin/service mysql stop
  while [[ "$(/usr/bin/pgrep mysql | /usr/bin/wc -l)" != 0 ]]; do
    sleep 1
  done
  sleep 3
  echo "MariaDB -> prepared"
fi
