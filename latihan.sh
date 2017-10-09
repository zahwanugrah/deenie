while :
do
clear
echo "------------------------------------------"
echo "                 Menu Utama               "
echo "------------------------------------------"
echo "[1] Menampilkan tanggal dan waktu hari ini"
echo "[2] Menampilkan file dalam direktori sekarang berada"
echo "[3] Menampilkan kalender saat ini"
echo "[4] Memulai editor untuk menulis pesan"
echo "[5] Menampilkan Nama dan NIM pengguna komputer"
echo "[6] Menampilkan angka mulai 1 sampai dengan 20"
echo "[7] Melihat aktifitas jaringan pada sistem"
echo "[8] Keluar dari Menu Utama"
echo "======================="
echo -n "Silakan masukkan pilihan Anda mulai 1 sampai 8 : "
read pilihan
case $pilihan in
     1) echo "Hari ini `date`" ;
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     2) echo "Files in `pwd`" ;
     ls;
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     3) cal ;
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     4) vi ;;
     5) echo "Nama : Rafdi Luthfan F"
     echo "NIM : 125150300111039"
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     6) echo "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19   20" ;
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     7) echo "`ifconfig`" ;
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
     8) exit 0 ;;
     *) echo "Maaf, pilihan yang Anda masukkan tidak terdaftar di Menu Utama";
     echo "tekan sembarang tombol untuk kembali ke Menu Utama" ;
     read ;;
esac

done
