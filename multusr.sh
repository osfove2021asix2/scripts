#!/bin/bash

wget http://www.collados.org/asix2/m06/uf2/pr2/usuaris.ods
libreoffice --convert-to csv usuaris.ods usuaris.csv --headless
clear
usuaris="usuaris.csv"
IFS=","
while read user name
do
#He de crear una funcion que me aumente el numero de la UID. Pero por mucho que lo intentaba me daba error.
useradd -m $name -g users -u 3001 -s /bin/bash
done < $usuaris
exit 0
