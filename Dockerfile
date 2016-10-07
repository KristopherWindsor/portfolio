FROM php:7.0-apache

RUN apt-get update && apt-get install -y
RUN apt-get install -y git
RUN apt-get install -y mysql-client libmysqlclient-dev && docker-php-ext-install mysqli

RUN a2enmod rewrite

# Get Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Put repo in here - the html folder ends up at /var/www/html as expected
COPY . /var/www/

# Composer install
RUN cd /var/www && composer install

# Fix permissions
RUN chown -R www-data:www-data /var/www/*

# This file has the data we want to show
ENTRYPOINT mysql -h $DB_PORTFOLIO_HOST --port $DB_PORTFOLIO_PORT -u $DB_PORTFOLIO_USER -p$DB_PORTFOLIO_PW -D $DB_PORTFOLIO_DB < /var/www/scripts/kristopher_data.sql
