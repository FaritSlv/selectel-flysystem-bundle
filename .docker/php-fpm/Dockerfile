FROM farit/php7.4.28-fpm-alpine-oci8:latest

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /var/www

EXPOSE 9000

CMD ["php-fpm"]
