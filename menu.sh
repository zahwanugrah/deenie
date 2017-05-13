#!/bin/bash
clear

myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear

	#echo "--------------- Selamat datang di Server - IP: $MYIP ---------------"
	echo ""
	echo ""
	echo ""
	#cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	#cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	#freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	#tram=$( free -m | awk 'NR==2 {print $2}' )
	#swap=$( free -m | awk 'NR==4 {print $2}' )
	#up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	#echo -e "\e[032;1mCPU model:\e[0m $cname"
	#echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	#echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	#echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	#echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	#echo -e "\e[032;1mSystem uptime:\e[0m $up"
lolcat -F 0.3 -S 0 /usr/bin/bannermenu
echo "                    server: $MYIP"
date +"                    %A, %d-%m-%Y" | lolcat
date +"                            %H:%M:%S %Z" | lolcat
echo ""
echo ""
PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
options=("Buat User SSH/OVPN" "Buat User SSH/OVPN Trial" "Perbarui User" "Ganti Password User SSH/OVPN" "Semua User Dan Tanggal Kadaluarsa" "Hapus User" "Buat User PPTP VPN" "Monitoring Dropbear Menurut Port" "Monitor User Login" "Daftar User Aktif" "Daftar User Kadaluarsa" "Disable User Kadaluarsa" "Hapus User Kadaluarsa" "Banned User" "Unbanned User" "Penggunaan Ram" "Speedtest" "Benchmark" "Kill Multi Login Manual" "Aktifkan Auto Kill Multi Login" "Matikan Auto Kill Multi Login" "Ganti Password VPS" "Bersihkan Cache Ram Manual" "Edit Banner Login" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid3" "Restart OpenVPN" "Update Script VPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Buat User SSH/OVPN")
	clear
        user-add | lolcat
        break
            ;;
	"Buat User SSH/OVPN Trial")
	clear
	user-gen | lolcat
	break
	;;
	"Perbarui User")
	clear
	user-renew | lolcat
	break
	;;
	"Ganti Passwort User SSH/OVPN")
	clear
	user-pass
	break
	;;
	"Semua User Dan Tanggal Kadaluarsa")
	clear
	user-list | lolcat
	break
	;;
	"Hapus User")
	clear
	user-del | lolcat
	break
	;;
	"Buat User PPTP VPN")
	clear
	user-add-pptp | lolcat
	break
	;;
	"Monitoring Dropbear Menurut Port")
	clear
	read -p "Isikan Port Dropbear Yang Akan Di Monitor: " PORT
	dropmon $PORT
	break
	;;
	"Monitor User Login")
	clear
	user-login |boxes -d peek | lolcat
	break
	;;
	"Kill Multi Login Manual")
	clear
        read -p "Isikan Maximal User Login (1-2): " MULTILOGIN
        user-limit $MULTILOGIN
	break
	;;
	"Aktifkan Auto Kill Multi Login")
	clear 
	read -p "Isikan Maxsimal User Login (1-2): "MULTILOGIN
	echo "* * * * * root /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit1
	echo "* * * * * root sleep 10; /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit2
        echo "* * * * * root sleep 20; /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit3
        echo "* * * * * root sleep 30; /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit4
        echo "* * * * * root sleep 40; /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit5
        echo "* * * * * root sleep 50; /usr/bin/user-limit $MULTILOGIN" > /etc/cron.d/userlimit6
	service cron restart
	service ssh restart
	service dropbear restart
	clear
	echo "------------+ AUTO KILL SUDAH DI AKTIFKAN BOSS +--------------" | lolcat
	echo "Dasar pelit!!! user ente marah2 jangan salahkan ane ya boss,nanti jangan lupa di matikan boss"| lolcat
	break
	;;
	"Matikan Auto Kill Multi Login")
	clear
	rm -rf /etc/cron.d/userlimit1
	rm -rf /etc/cron.d/userlimit2
	rm -rf /etc/cron.d/userlimit3
	rm -rf /etc/cron.d/userlimit4
	rm -rf /etc/cron.d/userlimit5
	rm -rf /etc/cron.d/userlimit6
	service cron restart
	service ssh restart
	service dropbear restart
	clear
	echo "AUTO KILL LOGIN,SUDAH SAYA MATIKAN BOS 
User Sudah Bisa Multi Login Lagi!!!" | boxes -d boy | lolcat
	break
	;;
	"Ganti Password VPS")
	clear
	read -p "Silahkan isi password baru untuk VPS anda: " pass	
        echo "root:$pass" | chpasswd
	echo "Ciieeee.. Ciieeeeeee.. Abis Ganti Password VPS Nie Yeeee...!!!"| boxes -d boy | lolcat
	break
	;;
	"Bersihkan Cache Ram Manual")
	clear
	echo "Sebelum..." | lolcat
        ps-mem
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo ""
	echo "Sesudah..." | lolcat
	ps-mem
	echo "SUKSES..!!!Cache ram anda sudah di bersihkan." | boxes -d boy | lolcat
        break
	;;
	"Daftar User Aktif")
	clear
	user-active-list
	break
	;;
	"Daftar User Kadaluarsa")
	clear
	user-expire-list
	break
	;;
	"Disable User Kadaluarsa")
	clear
	disable-user-expire
	break
	;;
	"Hapus User Kadaluarsa")
	clear
	delete-user-expire
	break
	;;
	"Banned User")
	clear
	banned-user
	break
	;;
	"Unbanned User")
	clear
	unbanned-user
	break
	;;
	"Penggunaan Ram")
	clear
	ps-mem
	break
	;;
	"Speedtest")
	clear
	speedtest --share
	break
	;;
	"Benchmark")
	benchmark
	break
	;;
        "Edit Banner Login")
	clear
	echo -e "1. Simpan text (CTRL + X, lalu ketik Y dan tekan Enter) " | lolcat
	echo -e "2. Membatalkan edit text (CTRL + X, lalu ketik N dan tekan Enter)" | lolcat
	read -p "Tekan ENTER untuk melanjutkan........................ " | lolcat
	nano /etc/issue.net
	service dropbear restart && service ssh restart
	break
	;;
	"Edit Banner Menu")
	clear
	echo -e "1. Simpan text (CTRL + X, lalu ketik Y dan tekan ENTER)" | lolcat
	echo -e "2. Membatalkan edit text (CTRL + X,lalu ketik N dan tekan ENTER)" | lolcat
	echo ""
	read -p "Tekan ENTER untuk melanjutkan..................."
	nano /usr/bin/bannermenu
	break
	;;
	"Lihat Lokasi User")
	clear
	user-login
	echo "Contoh: 112.123.345.126 lalu Enter"
        read -p "Ketik Salah Satu Alamat IP User: " userip
        curl ipinfo.io/$userip
        break
	;;
	"Restart Webmin")
	 service webmin restart
	 echo "Webmin sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Server VPS")
	 reboot
	 echo "sudah di restart tunggu sebentar ya boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Dropbear")
	 service dropbear restart
	 echo "Dropbear sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenSSH")
	 service ssh restart
	 echo "OpenSSH sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenVPN")
	 service openvpn restart
	 echo "openvpn sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Squid3")
	 service squid3 restart
	 echo "Squid3 sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Update Script VPS")
	 /usr/bin/menu-update-script-vps.sh
	 break
	 ;;
	"Quit")
	
	break
	;;
	 
        *) echo invalid option;
	esac
done
