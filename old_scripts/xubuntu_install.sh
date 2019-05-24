#sudo apt-get install -y xorg gnome-core unclutter chromium-browser
#fullscreen bug in chromium forced me to the dark side
#get Chrome
#DID THESE STEPS MANUALLY (XUBUNTU 18.10 desktop, testing 4K graphics)
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo apt-get update
#sudo apt-get upgrade -y
#sudo apt-get -y install google-chrome-stable
 

#shell only (obsolete)!
#sudo apt-get install -y xorg gnome-core unclutter google-chrome-stable

#AND THEN RAN INSTALL SCRIPT FROM HERE

sudo adduser --disabled-password --gecos "" kiosk
#disabled for xubuntu
#sudo cp -r extensions/* /usr/share/gnome-shell/extensions/

cp suspend_until.sh ~/suspend_until.sh
sudo chown kioskadmin:kioskadmin ~/suspend_until.sh
sudo chmod 755 ~/suspend_until.sh
#sudo mkdir /home/kiosk/.config
#sudo mkdir /home/kiosk/.config/chromium
#sudo mkdir /home/kiosk/.config/chromium/Default
#sudo cp -r config/chromium/Default/Preferences /home/kiosk/.config/chromium/Default/Preferences
#sudo cp -r config/chromium/Default/Extensions /home/kiosk/.config/chromium/Default/Extensions

#sudo cp -r "config/chromium/Default/Extension Rules" "/home/kiosk/.config/chromium/Default/Extension Rules"

sudo cp -r kiosk_user/.config /home/kiosk/.config
sudo cp -r kiosk_user/Desktop /home/kiosk/Desktop
#sudo mkdir /home/kiosk/.local && sudo mkdir /home/kiosk/.local/share && sudo mkdir /home/kiosk/.local/share/keyrings
#sudo cp -r keyrings /home/kiosk/.local/share/keyrings
sudo cp kiosk_user/kiosk.sh /home/kiosk/kiosk.sh

#custom.conf contains auto-login
#does not work in xubuntu
#sudo cp custom.conf /etc/gdm3/custom.conf
#but this does
sudo cp example_lightdm.conf /etc/lightdm/lightdm.conf

sudo chown -R kiosk:kiosk /home/kiosk/
#sudo chown kiosk:kiosk /home/kiosk/kiosk.sh
sudo chmod 500 /home/kiosk/kiosk.sh
sudo chmod 500 /home/kiosk/Desktop/reboot.desktop
sudo chmod 500 /home/kiosk/Desktop/reboot2.desktop
sudo reboot
