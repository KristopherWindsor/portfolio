FROM php:7.0-apache

RUN apt-get update && apt-get install -y
RUN apt-get install -y git
RUN apt-get install -y mysql-client libmysqlclient-dev && docker-php-ext-install mysqli

RUN a2enmod rewrite

# Put repo in here - the html folder ends up at /var/www/html as expected
COPY . /var/www/

# Get Composer in current dir, copy, and run
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
COPY ./composer.phar /var/www
RUN cd /var/www && ./composer.phar install

# Fix permissions
RUN chown -R www-data:www-data /var/www/*

