#!/bin/sh
HOST='192.168.11.1'
USER='root'

echo "Please enter root password for device:"
read PASSWD

rm ka-lite.zip 2> /dev/null
cd ka-lite
zip ../ka-lite.zip * -r -x "/content/*"
cd ..

ncftp -u $USER -p $PASSWD $HOST <<END_SCRIPT
cd /mnt/storage/
binary
put ka-lite.zip
quit
END_SCRIPT

scripts/_install_kalite.sh $PASSWD
