FROM php:apache-bookworm AS app

RUN apt-get update && apt-get install -y zlib1g-dev libpng-dev libzip-dev libbz2-dev libicu-dev sqlite3 wget
RUN docker-php-ext-install gd zip bz2 intl

COPY ./nextcloud-apache.conf /etc/apache2/sites-available/nextcloud.conf

RUN a2ensite nextcloud.conf && a2enmod rewrite headers env dir mime

RUN wget https://download.nextcloud.com/server/installer/setup-nextcloud.php

RUN chown -R www-data:www-data /var/www/html/
