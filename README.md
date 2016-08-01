# larawell
Monolithic docker container to run your Laravel apps: MariaDB/Redis/Nginx/PHP7.0-Fpm

#### Why monolothic?

Larawell uses [phusion/baseimage](https://github.com/phusion/baseimage-docker#wait-i-thought-docker-is-about-running-a-single-process-in-a-container) and shares same convictions about running multiple logical services in a single container.

#### Includes

+ MariaDB
+ Redis
+ Nginx
+ PHP7.0-Fpm
+ NodeJs
+ npm
+ schedule:run
+ queue:work

Both schedule:run (cron) and queue:work (service) are included and running properly by default. There is no other docker container for Laravel that offers working cron or queue, so if you plan to run full featured Laravel app this should be your container of choice.

Note: Larawell uses `queue:work --daemon` instead of `queue:listen` as later was causing high CPU spikes. `docker stats` was reporting 10% CPU utlizaition on `queue:listen` versus hovering around 0.5% with `queue:work --daemon`.

#### Scripts

Container is bundled with 7 helper bash scripts. Few of them are required for correct functioning and some can be enabled on user discretion.

+ 01_mariadb_initialize.sh - 
+ 02_mariadb_secure.sh - 
+ 03_mariadb_prepare_database.sh - 
+ 04_laravel_install.sh - 
+ 05_laravel_migrate.sh - 
+ 06_laravel_seed.sh - 
+ 07_mariadb_import_dump.sh - 

#### Usage




