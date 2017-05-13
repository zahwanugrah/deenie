#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

disable-user-expire
clear

echo "----------------- DAFTAR AKUN SSH EXPIRE -------------------" | lolcat


cat /root/expireduser.txt
echo ""
