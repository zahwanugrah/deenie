#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

echo "------------------------------ GENERATE  AKUN SSH ------------------------------"

if [[ $vps = "zvur" ]]; then

	echo "            DEVELOPED BY YUSUF ARDIANSYAH N ELANG OVERDOSIS          "

echo ""

read -p "Berapa jumlah akun yang akan dibuat: " JUMLAH
read -p "Berapa hari akun aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo "-----------------------------------"
echo "Data Login:"
echo "-----------------------------------"
echo "Host/IP: $MYIP"
echo "Dropbear Port: 443, 110, 109"
echo "OpenSSH Port: 22, 143"
echo "Squid Proxy: 80, 8080, 3128"
echo "OpenVPN Config: http://$MYIP:81/client.ovpn"

for (( i=1; i <= $JUMLAH; i++ ))
do
	username=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $username
	#password=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1`;
	echo $username:$username | chpasswd
	
	echo "$i. Username/Password: $username"
done

echo "Valid s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo "-----------------------------------"
clear
echo -e ""| lolcat
echo -e "|       Informasi Akun Baru SSH      |" | boxes -d dog | lolcat
echo -e "============ -SERVER PREMIUM- =============" | lolcat
echo -e "     Host: $MYIP" | lolcat
echo -e "     Username: $username" | lolcat
echo -e "     Password: $password                   " | lolcat
echo -e "     Port default dropbear: 443,80         " | lolcat
echo -e "     Port default openSSH : 22,143         " | lolcat
echo -e "     Port default squid   : 8080           " | lolcat
echo -e "     Port default openVPN : 55             " | lolcat
echo -e "     Auto kill user maximal login 2        " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e "     Aktif Sampai: $(date -d "$AKTIF days" +"%d-%m-%Y")" | lolcat
echo -e "===========================================" | lolcat
echo -e "   DI LARANG:                              "| lolcat
echo -e "   HACKING-DDOS-PHISING-SPAM-TORENT        " | lolcat
echo -e "   CARDING-CRIMINAL CYBER.                 "| lolcat
echo -e "===========================================" | lolcat
echo -e "   Script by Yusuf Ardiansyah              "| lolcat
echo -e "   Config OVPN:                            "| lolcat
echo -e "   http://$MYIP:81/client.ovpn        " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e ""
echo -e ""
