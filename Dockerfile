FROM php:5.6-fpm

MAINTAINER Battcor <battcor@gmail.com>

RUN apt-get update

RUN apt-get install -y wget unzip git gcc

RUN git clone -b 2.0.x https://github.com/phalcon/cphalcon.git cphalcon-2.0.x && \
    cd cphalcon-2.0.x/build/ && \
    ./install

RUN docker-php-ext-enable phalcon.so

RUN pear install XML_Parser

RUN echo "date.timezone=\"Asia/Singapore\"" > /usr/local/etc/php/conf.d/timezone.ini

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y libmemcached-dev zlib1g-dev && \
	pecl install memcached-2.2.0 && \
	docker-php-ext-enable memcached

RUN pecl install memcache
RUN docker-php-ext-enable memcache
