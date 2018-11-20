FROM php:7.1-fpm
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring
WORKDIR /var/www/html
RUN composer create-project --prefer-dist laravel/laravel mylaravel
WORKDIR /var/www/html/mylaravel