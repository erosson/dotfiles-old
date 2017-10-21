#!/bin/sh -eux

sudo chsh -s /usr/bin/fish `whoami` 

# run syncthing on startup. https://docs.syncthing.net/users/autostart.html#linux
sudo systemctl enable syncthing@$USER.service 
sudo systemctl start syncthing@$USER.service 
# the directions in the docs don't quite work with an encrypted homedir - give it some extra time
sudo sed -i 's/\[Service\]/\[Service\]\nRestartSec=60/' /lib/systemd/system/syncthing@.service

mkdir -p ~/.config/autostart
cp /usr/share/applications/org.gnome.Terminal.desktop ~/.config/autostart/
cp /usr/share/applications/google-chrome.desktop ~/.config/autostart/
