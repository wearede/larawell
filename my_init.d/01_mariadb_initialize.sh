#!/bin/bash

if [[ ! -f /var/lib/mysql/status.initialized ]]; then
  echo "MariaDB -> initialize"
  mkdir -p /var/lib/mysql
  chown -R mysql:mysql /var/lib/mysql
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
  touch /var/lib/mysql/status.initialized
  echo "MariaDB -> initialized"
fi
