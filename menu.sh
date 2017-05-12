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
	lolcat -F 0.3 -S 0 /root/bannermenu
echo "              server: $MYIP"
date +"                    %A, %d-%m-%Y" | lolcat
date +"                            %H:%M:%S %Z" | lolcat
echo ""
	echo "------------------------------------------------------------------------------"
	echo "Apa yang ingin Anda lakukan?"
	echo -e "\e[031;1m 1\e[0m) Buat Akun SSH/OpenVPN (\e[34;1muser-add\e[0m)"
	echo -e "\e[031;1m 2\e[0m) Generate Akun SSH/OpenVPN (\e[34;1muser-gen\e[0m)"
	echo -e "\e[031;1m 3\e[0m) Ganti Password Akun SSH/OpenVPN (\e[34;1muser-pass\e[0m)"
	echo -e "\e[031;1m 4\e[0m) Tambah Masa Aktif Akun SSH/OpenVPN (\e[34;1muser-renew\e[0m)"
	echo -e "\e[031;1m 5\e[0m) Hapus Akun SSH/OpenVPN (\e[34;1muser-del\e[0m)"
	echo -e "\e[031;1m 6\e[0m) Buat Akun PPTP VPN (\e[34;1muser-add-pptp\e[0m)"
	echo -e "\e[031;1m 7\e[0m) Monitoring Dropbear (\e[34;1mdropmon [PORT]\e[0m)"
	echo -e "\e[031;1m 8\e[0m) Cek Login Dropbear, OpenSSH, PPTP VPN dan OpenVPN (\e[34;1muser-login\e[0m)"
	echo -e "\e[031;1m 9\e[0m) Kill Multi Login Manual (1-2 Login) (\e[34;1muser-limit [x]\e[0m)"
	echo -e "\e[031;1m10\e[0m) Daftar Akun dan Expire Date (\e[34;1muser-list\e[0m)"
	echo -e "\e[031;1m11\e[0m) Daftar Akun Aktif (\e[34;1muser-active-list\e[0m)"
	echo -e "\e[031;1m12\e[0m) Daftar Akun Expire (\e[34;1muser-expire-list\e[0m)"
	echo -e "\e[031;1m13\e[0m) Disable Akun Expire (\e[34;1mdisable-user-expire\e[0m)"
	echo -e "\e[031;1m14\e[0m) Delete Akun Expire (\e[34;1mdelete-user-expire\e[0m)"
	echo -e "\e[031;1m15\e[0m) Banned Akun (\e[34;1mbanned-user\e[0m)"
	echo -e "\e[031;1m16\e[0m) Unbanned Akun (\e[34;1munbanned-user\e[0m)"
	echo -e "\e[031;1m17\e[0m) Restart Dropbear (\e[34;1mservice dropbear restart\e[0m)"
	echo -e "\e[031;1m18\e[0m) Memory Usage (\e[34;1mps-mem\e[0m)"
	echo -e "\e[031;1m19\e[0m) Speedtest (\e[34;1mspeedtest --share\e[0m)"
	echo -e "\e[031;1m20\e[0m) Benchmark (\e[34;1mbenchmark\e[0m)"
	echo -e "\e[031;1m21\e[0m) Reboot Server (\e[34;1mreboot\e[0m)"
	echo ""
	echo -e "\e[031;1m x\e[0m) Exit"
	echo ""
	PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
options=("Buat User SSH/OVPN" "Buat User SSH/OVPN Trial" "Perbarui User" "Ganti Password User SSH/OVPN" "Semua User" "Hapus User" "Buat User PPTP VPN" "Monitor User Login" "Aktifkan Kill Multi Login" "Matikan Kill Multi Login" "User Belum Kadaluarsa" "User Sudah Kadaluarsa" "Ganti Password VPS" "Used Data By Users" "bench-network" "Status Ram" "Bersihkan cache ram" "Bersihkan Cache Squid" "Ganti Port OpenVPN" "Ganti Port Dropbear" "Ganti Port Openssh" "Ganti Port Squid3" "Speedtest" "Edit Banner Login" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "Restart Squid3" "Restart OpenVPN" "Update Script VPS" "Quit")
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
	"Semua User")
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
	
		7)
		clear
		read -p "Isikan Port Dropbear yang akan dimonitor: " PORT
		dropmon $PORT
		exit
		;;
		8)
		clear
		user-login
		exit
		;;
		9)
		clear
		read -p "Isikan Maximal Login (1-2): " MULTILOGIN
		user-limit $MULTILOGIN
		exit
		;;
		
		11)
		clear
		user-active-list
		exit
		;;
		12)
		clear
		user-expire-list
		exit
		;;
		13)
		clear
		disable-user-expire
		exit
		;;
		14)
		clear
		delete-user-expire
		exit
		;;
		15)
		clear
		banned-user
		exit
		;;
		16)
		clear
		unbanned-user
		exit
		;;
		17)
		clear
		service dropbear restart
		exit
		;;
		18)
		clear
		ps-mem
		exit
		;;
		19)
		clear
		speedtest --share
		exit
		;;
		20)
		clear
		benchmark
		exit
		;;
		21)
		clear
		reboot
		exit
		;;
		x)
		clear
		exit
		;;
	esac
done

cd ~/
rm -f /root/IP
