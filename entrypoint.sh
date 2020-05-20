#!/bin/bash

echo "----------------------------------------------------------"
echo "[!] init dokuwiki"
(
set -ex
if [[ -z "$(ls -A /var/www/dokuwiki)" ]]
then
        mkdir -p /var/www/dokuwiki
        cp -ar /var/tmp/dokuwiki/* /var/www/dokuwiki/
fi
)
echo "----------------------------------------------------------"
echo ""
echo "----------------------------------------------------------"
echo "[!] start apache2"
(set -x; service apache2 start)
echo "----------------------------------------------------------"
echo ""
echo "----------------------------------------------------------"
echo "[!] you should change permissions for /var/www/dokuwiki"
echo "    to www-data:www-data (c.f. id: 33) when mount volume."
echo "    # chown -R 33:33 /var/www/dokuwiki"
echo "----------------------------------------------------------"
echo ""
echo "----------------------------------------------------------"
echo "[!] you should run afterinstall.sh after install."
echo "----------------------------------------------------------"
sleep 2

tail -f /var/log/apache2/*
