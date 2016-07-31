#!/bin/bash

if [[ ! -f /var/lib/mysql/status.imported ]]; then
  echo "MariaDB -> import"
  #
  /usr/sbin/service mysql start
  while [[ "$(/usr/bin/mysql -B -N -u root -e "select 1")" != 1 ]]; do
    sleep 1
  done
  sleep 3
  #
  /usr/bin/mysql -v -u root -p"$MARIA_ROOT_PASSWORD" homestead < /database/import.sql
  touch /var/lib/mysql/status.imported
  #
  /usr/sbin/service mysql stop
  while [[ "$(/usr/bin/pgrep mysql | /usr/bin/wc -l)" != 0 ]]; do
    sleep 1
  done
  sleep 3
  echo "MariaDB -> imported"
fi
