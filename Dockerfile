FROM php:7.3.15-cli

RUN apt-get update && \
    apt-get install --no-install-recommends -y libpq-dev libicu-dev libzip-dev zlib1g-dev libc-client-dev libkrb5-dev cron rsyslog zip unzip && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install imap exif mysqli pdo pdo_mysql pdo_pgsql zip bcmath iconv mbstring pcntl intl && \
    curl -o /usr/local/bin/composer -sL https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer && composer self-update && \
    apt-get clean && composer clearcache && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /etc/cron.*

WORKDIR /app

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
