# Dockerfile
FROM php:apache

# Install mysqli extension
RUN apt-get update && apt-get install -y default-mysql-client
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
