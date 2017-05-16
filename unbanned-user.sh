#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)


# go to root
cd


clear

echo "---------------------- UNBANNED AKUN SSH ----------------------"

	echo "                                       "
	echo "                           EDITED YUSUF ARDIANSYAH                           "
	echo "                              "


	echo "         GUNAKAN DENGAN BIJAK            "
echo ""

cat /root/banneduser.txt
echo "--------------------------------------------------------------------"
echo ""

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Apakah Anda benar-benar ingin mem-unbanned akun [$username] [y/n]: " -e -i y UNBANNED
	if [[ "$UNBANNED" = 'y' ]]; then
		sed -i "s/ User : $username//g" /root/banneduser.txt
		sed -i /^$/d /root/banneduser.txt
		passwd -u $username
		echo ""
		echo "Akun [$username] berhasil diunbanned!"
	else
		echo ""
		echo "Unbanned akun [$username] dibatalkan!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi

