FROM php:7.0-apache

RUN apt-get update && apt-get install -y
RUN apt-get install -y git

RUN a2enmod rewrite

# Put repo in here - the html folder ends up at /var/www/html as expected
COPY . /var/www/

RUN chown -R www-data:www-data /var/www/*

