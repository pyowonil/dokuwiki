#!/bin/bash

echo "----------------------------------------------------------"
echo "[!] Delete the install.php file after finished installing"
(set -x; rm /var/www/dokuwiki/install.php)
echo "----------------------------------------------------------"
echo ""
echo "----------------------------------------------------------"
echo "[!] Needed for sending email (e.g. user registration):"
echo " => install sendmail program (e.g. postfix)"
echo "    # apt-get install postfix"
echo "----------------------------------------------------------"
