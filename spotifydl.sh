#!/usr/bin/env bash
if which python >/dev/null; then
    echo ""
    else
    echo "python tidak di temukan, silahkan jalankankan setup.sh terlebih dahulu"
    sleep 1
    exit
fi
if which spotdl >/dev/null; then
    else
    echo "script tidak di temukan, silahkan jalankankan setup.sh terlebih dahulu"
    sleep 1
    exit
fi
clear
echo "   ____          __  _ ___     ___  __ ";
echo "  / __/__  ___  / /_(_) _/_ __/ _ \/ / ";
echo " _\ \/ _ \/ _ \/ __/ / _/ // / // / /__";
echo "/___/ .__/\___/\__/_/_/ \_, /____/____/";
echo "   /_/                 /___/           ";
echo ""
dl='spotdl'
echo "
Silahkan pilih:
    1. Download Lagu Saja
    2. Download Album
    3. Download Semua Album
    4. Download list file
    0. Keluar
"
read -p "Masukan Pilihan [0-3] > "

if [[ $REPLY =~ ^[0-3]$ ]]; then
	if [[ $REPLY == 0 ]]; then
		echo "Program berhenti."
		exit
	fi
	if [[ $REPLY == 1 ]]; then
        read -p "Silahkan masukan link spotify : " link
		$dl -s $link
		spotifydl
	fi
	if [[ $REPLY == 2 ]]; then
        echo "nanti bakal jadi berupa file txt, untuk download nya pilih no 4"
		read -p "Silahkan masukan link spotify : " link
		$dl -b $link 
		spotifydl
	fi
    if [[ $REPLY == 3 ]]; then
        echo "nanti bakal jadi berupa file txt, untuk download nya pilih no 4"
		read -p "Silahkan masukan link spotify : " link
		$dl -ab $link
		spotifydl
	fi
    if [[ $REPLY == 4 ]]; then
		read -p "Silahkan masukan letak file list txt : " link
        read -p "Masukan nama folder untuk hasil download : " fdl
		$dl --list $link -f $fdl
		spotifydl
	fi
	
else
	echo "Tidak ada di menu" >&2
	exit 1
fi
