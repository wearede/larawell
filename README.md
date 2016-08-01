# larawell
Monolithic docker container to run your Laravel apps: MariaDB/Redis/Nginx/PHP7.0-Fpm

#### Why monolothic?
The Docker developers advocate the philosophy of running a single **logical** service per container. A logical service can consist of multiple OS processes.

#### Includes

+ MariaDB
+ Redis
+ Nginx
+ PHP7.0-Fpm
+ NodeJs
+ npm
+ schedule:run
+ queue:work

Both schedule:run (cron) and queue:work (service) are included and running properly by default. I couldn't find any other docker container for Laravel that offers working cron or queue, so if you plan to run full featured Laravel app this should be your container of choice.

Note: I'm using `queue:work --daemon` instead of `queue:listen` as later was causing high CPU spikes. `docker stats` was reporting 10% CPU utlizaition on `queue:listen` versus hovering around 0.5% with `queue:work --daemon`.


