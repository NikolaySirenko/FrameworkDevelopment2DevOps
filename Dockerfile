# Use the official PHP-Apache image
FROM php:8-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Install system dependencies and PHP extensions required by Laravel
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql 

# Composer 
# Requires substitution with a separate container via Docker Compose
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Enable Apache's rewrite module
RUN a2enmod rewrite

# Copy the existing Laravel application into the container
COPY . /var/www/html/

# Set the correct permissions for Laravel directories
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod o+w ./storage/ -R

# Update Apache virtual host configuration for Laravel
COPY apache-laravel.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 to the host machine
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]