#!/bin/bash
clear

flag=0

echo
source="https://raw.githubusercontent.com/elangoverdosis/deeniedoank"
cd
function update_script() {
cd
wget -O /usr/bin/updatescript.sh $source/debian7/updatescript.sh && clear && chmod +x /usr/bin/updatescript.sh && /usr/bin/updatescript.sh && rm -f /root/IP && rm -f /root/IPcarding
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
	
        break
        ;;
	"Install SQLmap")
	cd /root
	wget -O /usr/bin/install-sqlmap.sh $source/debian7/install-sqlmap.sh
	chmod 755 /usr/bin/install-sqlmap.sh
	clear
	/usr/bin/install-sqlmap.sh
	rm -f /root/IPcarding
	rm /usr/bin/install-sqlmap.sh

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
