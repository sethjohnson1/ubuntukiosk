#google chrome stuff
sudo add-apt-repository 'deb http://dl.google.com/linux/chrome/deb/ stable main'
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update
sudo apt install --no-install-recommends xorg google-chrome-stable pulseaudio network-manager
sudo systemctl enable network-manager
sudo systemctl start network-manager
sudo useradd -m kiosk
sudo cp -r kiosk_user/. /home/kiosk
sudo chown -R kiosk:kiosk /home/kiosk
sudo chmod 500 /home/kiosk/.profile
sudo chmod 500 /home/kiosk/.xinitrc
sudo chmod 500 /home/kiosk/.profile
