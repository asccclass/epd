#!/bin/sh

# cd /home/pi/ && sudo ./deviceclient
# /home/pi/epd/run.sh

hciconfig
HWID='01 4a 2b 4e 69'
ADVERTISE="13 02 01 06 03 03 6F FE 0B 16 6F FE 02 ${HWID} 7F 00"
sudo hciconfig hci0 up
sudo hcitool -i hci0 cmd 0x08 0x008 ${ADVERTISE}
sudo hciconfig hci0 leadv 3
