#!/bin/bash

clear
echo "Apa Anda Sudah Install Sqlmap, Klo Belum Install Dulu Boss!!!" | lolcat
	read -p "Klik ENTER untuk lanjut..."
	if [[ ! -e /root/sqlmap ]]; then
	echo "Maaf boss sqlmap belum di install, Silahkan install dulu :p" | lolcat
	exit
	fi
	cd
	PS3='Silahkan pilih (1-4):'
options=("Cari Web Vuln" "Hasil Pencarian Web Vuln" "Hacked" "Hacked Manual Sqlmap" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Cari Web Vuln")
	 web-vuln.sh
	 break
	     ;;
	  "Hasil Pencarian Web Vuln")
	  clear
	  less /root/uniscan6.2/sites.txt
	  break
	  ;;
	     "Hacked")
	     carding.sh
	     break
	    ;;
	    "Hacked Manual Sqlmap")
	    cd sqlmap
	    ./sqlmap.py -h
	    echo "Contoh: ./sqlmap.py -u http://www.siteTARGET.com --dbs" 
	    cd sqlmap
	    break
	    ;;
	    "Quit")
	    exit
	    break
	    ;;
	
	    *) echo invalid option;
	    esac
	    done
