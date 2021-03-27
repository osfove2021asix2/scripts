 #!/bin/bash
FECHA=$(date +%d%m%Y%H%M);
#root

if [ "$EUID" -ne 0 ]; then
	echo "This script must be run as root"
	exit 1
fi

#COPIA De seguridad
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf$FECHA; 
#Rellenar DAtos

echo -n 
echo  "subnet:" 
read sub
echo  "netmask: "
read mask
echo  "range: "
read rang
echo  "option domain-name-servers: "
read dns
echo  "option routers: "
read rout
echo  "option broadcast-address: "
read broad
echo  "default-lease-time: "
read dls
echo  "max-lease-time: "
read mls
read OPTION
echo "$OPTION"

echo "subnet $sub netmask $mask {" > /etc/dhcp/dhcpd.conf 
echo  "range $rang; " >> /etc/dhcp/dhcpd.conf 
echo  "option domain-name-servers $dns;" >> /etc/dhcp/dhcpd.conf 
echo  "option routers $rout;" >> /etc/dhcp/dhcpd.conf 
echo  "option broadcast-address $broad;" >> /etc/dhcp/dhcpd.conf 
echo  "default-lease-time $dls;" >> /etc/dhcp/dhcpd.conf 
echo  "max-lease-time $mls;"  >> /etc/dhcp/dhcpd.conf 
echo  "ddns update syle none" >> /etc/dhcp/dhcpd.conf 
echo  "}" >> /etc/dhcp/dhcpd.conf

sudo systemctl restart isc-dhcp-server.service;



