#!/bin/sh

sudo echo "static domain_name_servers=8.8.8.8 140.109.1.10 1.1.1.1" >>  /etc/dhcpcd.conf

sudo timedatectl set-timezone Asia/Taipei
sudo apt-get install p7zip-full -y
sudo ssh-keygen
sudo raspi-config

# BCM2835
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.68.tar.gz
tar zxvf bcm2835-1.68.tar.gz
cd bcm2835-1.68/
sudo ./configure
sudo make
sudo make check
sudo make install
cd ../
rm -rf bcm2835-1.68
rm -rf bcm2835-1.68.tar.gz

# wiringPi
sudo apt-get install wiringpi -y
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
gpio -v
rm -f wiringpi-latest.deb

wget https://github.com/asccclass/epd/releases/download/v0.0.3/epd-master.zip
unzip epd-master.zip
mv epd-master epd
chown pi /home/pi/epd
chgrp pi /home/pi/epd
chown pi /home/pi/epd/*
chgrp pi /home/pi/epd/pic/*
chown pi /home/pi/epd/pic/*
chgrp pi /home/pi/epd/*

mkdir /home/pi/.config/autostart
cp /home/pi/epd/resh.desktop /home/pi/.config/autostart

crontab -l > tmpcron
echo "30 2,7,16 * * * sudo shutdown -r now" >> tmpcron
crontab tmpcron
rm -r tmpcron

echo "Installation finished."
