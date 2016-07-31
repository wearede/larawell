#!/bin/bash

if [[ ! -f /var/lib/mysql/status.artisan.seeded ]]; then
  echo "Laravel -> artisan seed"

  touch /var/lib/mysql/status.artisan.seeded
  echo "Laravel -> artisan seeded"
fi
