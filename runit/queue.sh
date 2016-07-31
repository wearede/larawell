#!/bin/sh

echo "QUEUE -> start"
/usr/bin/php /var/www/artisan queue:work --daemon
