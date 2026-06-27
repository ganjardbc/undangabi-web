# Stage 1: build frontend assets
FROM node:18-alpine AS frontend
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY resources/ resources/
COPY webpack.mix.js ./
COPY public/css public/css
COPY public/js public/js
RUN npm run prod

# Stage 2: PHP-FPM app
FROM php:8.1-fpm-alpine

# system deps for PHP extensions
RUN apk add --no-cache \
    libpng-dev freetype-dev libjpeg-turbo-dev \
    libzip-dev libxml2-dev oniguruma-dev \
    && docker-php-ext-configure gd \
        --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql gd zip mbstring xml bcmath exif fileinfo

# install composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# install PHP dependencies (production only)
COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --optimize-autoloader --no-scripts

# copy app source
COPY . .

# copy compiled frontend assets from stage 1
COPY --from=frontend /app/public/js public/js
COPY --from=frontend /app/public/css public/css
COPY --from=frontend /app/public/mix-manifest.json public/mix-manifest.json

# run post-install scripts now that full app is present
RUN composer run-script post-autoload-dump

# fix permissions
RUN chown -R www-data:www-data storage bootstrap/cache public/contents \
    && chmod -R 775 storage bootstrap/cache public/contents

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]
