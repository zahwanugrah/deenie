#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
#MYIP=$(wget -qO- ipv4.icanhazip.com);


# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
#myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

#vps="zvur";
#vps="aneka";

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
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo "Hubungi: editor ( elang overdosis atau yusuf ardiansyah)"
	else
		echo "Hubungi: editor ( elang overdosis atau yusuf ardiansyah)"
	fi
	rm -f /root/IPcarding
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
sed -i 's/$func->CheckUpdate();/#$func->CheckUpdate();/g' /root/uniscan6.2/uniscan.pl
wget -O /root/uniscan6.2/Languages/en.lang $source/debian7/en.lang
chmod 644 /root/uniscan6.2/Languages/en.lang
rm uniscan6.2.tar.gz
cd
sudo apt-get install libmoose-perl
clear
cd /root
wget -O /usr/bin/carding_hack $source/debian7/carding_hack.sh
chmod +x /usr/bin/carding_hack
clear
cd /root

