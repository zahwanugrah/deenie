#!/bin/bash
clear

flag=0

echo
source="https://raw.githubusercontent.com/elangoverdosis/deeniedoank"
cd
function update_script() {
cd
wget -O /usr/bin/updatescript.sh $source/debian7/updatescript.sh && clear && chmod +x /usr/bin/updatescript.sh && /usr/bin/updatescript.sh
}
function carding_hack() {
echo " Apa Anda Sudah Install Sqlmap, Klo Belum Install Dulu Boss!!!"
	read -p "Klik ENTER..."
	if [[ ! -e /root/sqlmap ]]; then
	echo "Maaf boss sqlmap belum di install, Silahkan install dulu :p"
	exit
	fi
	cd
	carding.sh
	}
clear
echo "SELAMAT DATANG DI MENU UPDATE SCRIPT VPS" | boxes -d dog | lolcat
PS3='Silahkan ketik angka 1 untuk update script lalu ENTER: '
options=("Update Script VPS" "Install SQLmap" "Carding" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Update Script VPS")
        update_script
	clear
        break
        ;;
	"Install SQLmap")
	wget -O /usr/bin/install-sqlmap.sh $source/debian7/install-sqlmap.sh && clear && chmod +x /usr/bin/install-sqlmap.sh && /usr/bin/install-sqlmap.sh
	clear
	break
	;;
	"Carding")
	carding_hack
	break
	;;
        "Quit")
        exit
        break
        ;;
        	 
        *) echo invalid option;
	esac
done
