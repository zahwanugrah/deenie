#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)


echo "------------------- MEMBUAT AKUN  PPTP VPN ----------------------" | lolcat

	echo "          DEVELOPED BY YUSUF ARDIANSYAH AND ELANG OVERDOSIS            " | lolcat
echo ""

read -p "Isikan username baru: " username
read -p "Isikan password akun [$username]: " password

echo "$username pptpd $password *" >> /etc/ppp/chap-secrets

echo ""
echo "-----------------------------------"
echo "INFORMASI AKUN PPTP VPN:" | boxes -d peek | lolcat
echo "-----------------------------------"
echo "Host/IP: $MYIP" | lolcat
echo "Username: $username" | lolcat
echo "Password: $password" | lolcat
echo "-----------------------------------"
