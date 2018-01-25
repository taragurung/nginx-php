FROM ubuntu

#install nginx and php-fpm
RUN apt-get update
RUN apt-get install -y wget\
    curl \
    git \
    nginx \
    php7.0-fpm \
    php7.0-cli

#install php-extensions essential for mangento2
RUN apt-get install -y  php-intl \
    php-bcmath \
    php-curl \
    php-gd \
    php-mbstring \
    php-mcrypt \
    php-common \
    php-pdo  \
    php-mysql \
    php-soap  \
    php-xml  \
    php-xsl \
    php-zip \
    php-json \
    php-iconv

#these setting is recommended
#cgi.fix_pathinfo=0
ADD ./config/php.ini /etc/php/7.0/fpm/php.ini
#make nginx support php
ADD ./config/default /etc/nginx/sites-available/default
#settings
ADD ./config/fpm/php.ini  /etc/php/7.0/fpm/php.ini
ADD ./config/cli/php.ini  /etc/php/7.0/cli/php.ini



EXPOSE 80 443
COPY ./start.sh /var
ENTRYPOINT /var/start.sh

