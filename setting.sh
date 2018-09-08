#!/bin/sh
# written by fumiphys
# To use this script, execute
# $ chmod +x setting.sh
# $ ./setting.sh

# os information
# if you use mac, brew will be used.
# if you use linux, apt will be used.
# if you use windows, I will think it later.
if [ "$(uname)" == 'Darwin' ]; then
	OS="Mac"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	OS='Linux'
elif [ "$(expr substr %(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	OS='Cygwin'
else
	echo "Unsupported platform: ($(uname -a))"
	echo "Supported platform is: [Mac, Linux, Cygwin]"
	exit 1
fi
