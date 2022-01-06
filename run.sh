#!/bin/sh

rm -f /home/pi/epd/ashq-meeting-psk.json*
cd /home/pi/epd/ && wget https://t02.w.ascc.net/wlan-ashq-meeting/ashq-meeting-psk.json
cd /home/pi/epd/ && ./app

## for test: sudo /home/pi/epd/epd ASHQ_Meeting 43773477
