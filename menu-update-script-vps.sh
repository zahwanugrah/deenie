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
options=("Update Script VPS" "Install (anti ddos) DDOS deflate"Install SQLmap" "Carding" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Update Script VPS")
        update_script
	
        break
        ;;
	"Install (anti ddos) DDOS deflate")
	# Instal (D)DoS Deflate
if [ -d '/usr/local/ddos' ]; then
echo; echo; echo "Please un-install the previous version first"
exit 0
else
mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
sleep 3
q
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
