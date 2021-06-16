#!bin/bash
echo -e "Nazar Vynnyk DEVOPS=$DEVOPS" > index.html
mv index.html /var/www/html/index.html

apachectl -D FOREGROUN