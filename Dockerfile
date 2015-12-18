# vim:set ft=dockerfile:
FROM osminogin/php-fpm:latest

RUN apt-get update && apt-get -y install \
    php5-curl \
    git

RUN git clone -b branch-2 https://github.com/netgusto/Baikal.git /baikal
WORKDIR /baikal

RUN php -r "readfile('https://getcomposer.org/installer');" | php

RUN cp app/config/defaults/data.parameters.dist.yml data/parameters.yml
RUN cp app/config/defaults/data.environment.dist.yml data/environment.yml

RUN php composer.phar install --optimize-autoloader

EXPOSE 9000
VOLUME /baikal/data
CMD php app/console server:run 0.0.0.0:9000 --env=prod
