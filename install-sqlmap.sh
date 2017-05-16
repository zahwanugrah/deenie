#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
vps="aneka";

#if [[ $vps = "zvur" ]]; then
	#source="http://"
#else
	source="https://raw.githubusercontent.com/elangoverdosis/deeniedoank"
#fi

# go to root
cd

# check registered ip
wget -q -O IPcarding $source/debian7/IPcarding.txt
if ! grep -w -q $MYIP IPcarding; then
	echo "Maaf, hanya MEMBER terdaftar yang bisa menggunakan fitur ini!"
	if [[ $vps = "zvur" ]]; then
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	else
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	fi
	rm -f /root/IPcarding
	rm /root/IPcarding
	exit
fi
cd
apt-get install git
git clone https://github.com/elangoverdosis/sqlmap.git
clear
cd sqlmap
chmod 755 sqlmap.py

cd /root
wget -O /usr/bin/carding.sh $source/debian7/carding.sh
chmod +x /usr/bin/carding.sh
clear
cd /root

wget -O /usr/bin/web-vuln.sh $source/debian7/web-vuln.sh
chmod +x /usr/bin/web-vuln.sh
clear
cd /root

wget $source/debian7/uniscan6.2.tar.gz
tar xf uniscan6.2.tar.gz
rm uniscan6.2.tar.gz
cd
sudo apt-get install libmoose-perl
clear
cd /root
