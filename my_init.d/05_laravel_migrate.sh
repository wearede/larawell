#!/bin/bash

if [[ ! -f /var/lib/mysql/status.artisan.migrated ]]; then
  echo "Laravel -> artisan migrate"

  touch /var/lib/mysql/status.artisan.migrated
  echo "Laravel -> artisan migrated"
fi
