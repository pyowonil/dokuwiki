FROM ubuntu:18.04

# `cp -ar /var/tmp/dokuwiki/* /var/www/dokuwiki/` in entrypoint.sh
COPY dokuwiki /var/tmp/dokuwiki
COPY afterinstall.sh /
COPY entrypoint.sh /
WORKDIR /
EXPOSE 80
VOLUME /var/www/dokuwiki

ENV TZ="Asia/Seoul"
RUN \
    # init apt
    apt-get update; \
    # install Apache2 and PHP \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 libapache2-mod-php php-xml; \
    # enable Apache Rewrite module \
    a2enmod rewrite; \
    # stop apache2 service \
    service apache2 stop; \
    # change document root in Apache to point to /var/www/dokuwiki \
    sed -i -e "s|/var/www/html|/var/www/dokuwiki|" /etc/apache2/sites-enabled/000-default.conf; \
    # change AllowOverrides setting in Apache2 to use .htaccess files for security \
    sed -i -e "172s/None/All/" /etc/apache2/apache2.conf; \
    # change permissions \
    chown -R www-data:www-data /var/tmp/dokuwiki; \
    # clean apt \
    apt-get clean

CMD ["/entrypoint.sh"]
