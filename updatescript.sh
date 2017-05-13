#!/bin/bash
#echo "Maaf.. Saat ini belum tersedia update script bos......!!!" | boxes -d boy
#echo "Update webmin tersedia bos, tp versi webmin 1.820_all.deb..gk apa2 ya boss.." | lolcat
sleep 4
cd
wget "http://prdownloads.sourceforge.net/webadmin/webmin_1.820_all.deb"
dpkg --install webmin_1.820_all.deb
apt-get -y -f install
rm /root/webmin_1.820_all.deb
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart

clear
echo "selesai bosss...." | lolcat
sleep 3
rm /usr/bin/updatescript.sh
clear
menu
