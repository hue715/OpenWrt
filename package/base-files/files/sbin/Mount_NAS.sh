#!/bin/sh

cd /mnt
if [ ! -d nas  ];then
  mkdir nas
else
  echo dir exist
fi
echo "now mounting DS918"
for i in `seq 1 100`
do
	mountpoint -q /mnt/nas;ret="$(echo $?)";
	if [ $ret -eq 0 ]
	then
		echo "mount DS918 OK"
		break
	else
		sleep 10
		mount -t cifs //10.10.10.200/nas /mnt/nas -o username=nas,password=szx162738Q,iocharset=utf8,vers=2.0;
	fi
done
if [ ! -d music  ];then
  mkdir music
else
  echo music exist
fi
echo "now mounting DS918 Music"
for i in `seq 1 100`
do
	mountpoint -q /mnt/music;ret="$(echo $?)";
	if [ $ret -eq 0 ]
	then
		echo "mount DS918 music OK"
		break
	else
		sleep 10
		mount -t cifs //10.10.10.200/music /mnt/music -o username=hue715,password=szx162738Q,iocharset=utf8,vers=2.0;
	fi
done

