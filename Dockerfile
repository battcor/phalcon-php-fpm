FROM php:5.6-fpm

MAINTAINER Battcor <battcor@gmail.com>

RUN apt-get update

RUN apt-get install -y wget unzip gcc

RUN wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.13.zip && \
    unzip phalcon-v2.0.13.zip && \
    cd cphalcon-phalcon-v2.0.13/build && \
    ./install

RUN docker-php-ext-enable phalcon.so

RUN pear install XML_Parser
