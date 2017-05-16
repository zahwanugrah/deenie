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
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	else
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	fi
	rm -f /root/IPcarding
	exit
fi
echo "####################################
# Uniscan project                  #
# http://uniscan.sourceforge.net/  #
####################################
V. 6.3


OPTIONS:
        -u      <url> example: https://www.example.com/
        -f      <file> list of url
        -b      Uniscan go to background
        -q      Enable Directory checks
        -w      Enable File checks
        -e      Enable robots.txt and sitemap.xml check
        -d      Enable Dynamic checks
        -s      Enable Static checks
        -r      Enable Stress checks
        -i      <dork> Bing search
        -o      <dork> Google search
        -g      Web fingerprint
        -j      Server fingerprint

contoh:
 -u http://www.example.com/ -qweds
 -f sites.txt -bqweds
 -i uniscan
 -i "ip:xxx.xxx.xxx.xxx"
 -o "inurl:test"
 -u https://www.example.com/ -r"
 
# web vuln
cd /root
cd uniscan6.2
clear
read -p "Masukkan OPTION seperti contoh (CARI WEB VULN): " webscaner
clear
./uniscan.pl $webscaner
echo ""
