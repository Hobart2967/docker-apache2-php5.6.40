FROM php:5.6-apache

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install --yes --force-yes cron g++ gettext libicu-dev openssl libc-client-dev libkrb5-dev  libxml2-dev libfreetype6-dev libgd-dev libmcrypt-dev bzip2 libbz2-dev libtidy-dev libcurl4-openssl-dev libz-dev libmemcached-dev libxslt-dev

RUN a2enmod rewrite
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install \
  mysqli \
  pdo_mysql \
  mysql \
  bz2 \
  bcmath \
  calendar \
  dba \
  exif \
  ftp \
  gd \
  gettext \
  imap \
  shmop \
  soap \
  sockets \
  sysvmsg \
  wddx \
  xsl \
  zip

RUN docker-php-ext-enable \
  mysqli \
  pdo_mysql \
  mysql \
  bz2 \
  bcmath \
  calendar \
  dba \
  exif \
  ftp \
  gd \
  gettext \
  imap \
  shmop \
  soap \
  sockets \
  sysvmsg \
  wddx \
  xsl \
  zip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr
RUN docker-php-ext-install gd

COPY ./ /var/www/html/
