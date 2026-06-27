FROM php:8.1-apache

# PHP / Apache extensions
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
       git unzip zip libzip-dev libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
       libicu-dev libxml2-dev \
    && docker-php-ext-install -j"$(nproc)" pdo_mysql zip intl soap gd \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && rm -rf /var/lib/apt/lists/*

# Apache rewrite
RUN a2enmod rewrite headers env

COPY docker/vhost.conf /etc/apache2/sites-available/laravel.conf
RUN a2dissite 000-default.conf && a2ensite laravel.conf
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# PHP deps
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --optimize-autoloader --no-scripts --prefer-dist --no-progress

# App source
COPY . .

RUN composer run-script post-autoload-dump \
    && chown -R www-data:www-data storage bootstrap/cache public/contents \
    && chmod -R 775 storage bootstrap/cache public/contents

EXPOSE 80
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]