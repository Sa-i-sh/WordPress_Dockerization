FROM wordpress:php8.2-apache

RUN apt-get update && apt-get install -y --no-install-recommends unzip git curl && rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp

COPY wp-content /var/www/html/wp-content

RUN chown -R  www-data:www-data /var/www/html/wp-content

ENV WORDPRESS_DEBUG=false

USER www-data
