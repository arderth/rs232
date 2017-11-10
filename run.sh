#!/bin/bash
sudo rm /boot/cmdline.txt
sudo touch /boot/cmdline.txt
sudo sh -c "echo 'consoleblank=1 logo.nologo dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=84fa8189-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait  quiet   plymouth.ignore-serial-consoles loglevel=1 quiet' >> /boot/cmdline.txt"
sudo python -m pip install pyserial
cp /home/pi/piSignagePro/rs232/TVon.py /home/pi/TVon.py
cp /home/pi/piSignagePro/rs232/TVoff.py /home/pi/TVoff.py
touch mycron
echo "# m h  dom mon dow   command" >> mycron
echo "@reboot python /home/pi/TVon.py" >> mycron
echo "00 04 * * * sudo reboot" >> mycron
crontab mycron
rm mycron
sudo rm /etc/wpa_supplicant/wpa_supplicant.conf
sudo cp /home/pi/piSignagePro/rs232/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
sed -i -e 's/.*"config_server".*/    "config_server": "englassmedya.com",/g'   -e 's/.*"media_server".*/    "media_server":   "englassmedya.com",/g'  /home/pi/piSignagePro/package.json
echo "********Islem Tamamlandi.**********"
