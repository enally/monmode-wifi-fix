#!/bin/bash

key=$1

show_help() {
    echo "Usage: $0 [option...]" >&2
    echo
    echo "   -x, --kil              Kill network processes that interfere with aircrack suite"
    echo "   -f, --fix              fix processes after use "
    echo 
    exit 1
}

case $key in 
	-x|--kill)
	sudo service network-manager stop
	sudo service avahi-daemon stop
	sudo pkill wpa_supplicant
	shift
	;;
	-f|--fix)
	sudo service network-manager start
	shift
	;;
	-h|--help)
	show_help
	shift
	;;
esac