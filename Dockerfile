FROM php:8.4-fpm
WORKDIR /var/www
RUN apt-get update && apt-get install -y\
    sqlite-dev\
    php84-pdo_sqlite\
    libpng-dev libzip-dev &&\
     docker-php-ext-install pdo_mysql zip pdo_sqlite
COPY . /var/www
RUN composer install --no-dev --optimize-autoloader
EXPOSE 9000
CMD ["php", "-S", "0.0.0.0:9000", "-t", "public"]
