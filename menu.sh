#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)




while :
do
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
echo "              server: $MYIP"
date +"                    %A, %d-%m-%Y" | lolcat
date +"                            %H:%M:%S %Z" | lolcat
echo ""
	echo ""
	PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
options=("Buat User SSH/OVPN" "Buat User SSH/OVPN Trial" "Perbarui User" "Ganti Password User SSH/OVPN" "Semua User Dan Tanggal Kadaluarsa" "Hapus User" "Buat User PPTP VPN" "Monitoring Dropbear Menurut Port" 'Monitor User Login" "Daftar User Aktif" "Daftar User Kadaluarsa" "Disable User Kadaluarsa" "Hapus User Kadaluarsa" "Banned User" "Unbanned User" "Penggunaan Ram" "Speedtest" "Benchmark" "Kill Multi Login Manual" Aktifkan Kill Multi Login "Matikan Kill Multi Login" "User Belum Kadaluarsa" "User Sudah Kadaluarsa" "Ganti Password VPS" "Used Data By Users" "Bersihkan cache ram" "Bersihkan Cache Squid" "Ganti Port OpenVPN" "Ganti Port Dropbear" "Ganti Port Openssh" "Ganti Port Squid3" "Edit Banner Login" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid3" "Restart OpenVPN" "Update Script VPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Buat User SSH/OVPN")
	clear
        user-add
        break
            ;;
	"Buat User SSH/OVPN Trial")
	clear
	user-gen
	break
	;;
	"Perbarui User")
	clear
	user-renew
	break
	;;
	"Ganti Passwort User SSH/OVPN")
	clear
	user-pass
	break
	;;
	"Semua User Dan Tanggal Kadaluarsa")
	clear
	user-list
	break
	;;
	"Hapus User")
	clear
	user-del
	break
	;;
	"Buat User PPTP VPN")
	clear
	user-add-pptp
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
	user-login
	break
	;;
	"Kill Multi Login Manual")
	clear
        read -p "Isikan Maximal Login (1-2): " MULTILOGIN
        user-limit $MULTILOGIN
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
        
	"Quit")
		
		break
		;;
	 
        *) echo invalid option;
	esac
done

cd ~/
rm -f /root/IP
