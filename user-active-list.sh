#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)



disable-user-expire
clear

#echo "---------------------------- DAFTAR AKUN SSH ACTIVE ----------------------------"



echo "DEVELOPED BY YUSUF ARDIANSYAH AND ELANG OVERDOSIS"
echo ""

cat /root/activeuser.txt
echo ""
