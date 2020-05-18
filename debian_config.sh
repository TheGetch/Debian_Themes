#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root or sudo"
  exit
fi

echo '########################### apt update'
apt update

echo '########################### Installing gtk2-engines-murrine'
apt install gtk2-engines-murrine

echo '########################### Installing lightdm-gtk-greeter-settings'
apt install lightdm-gtk-greeter-settings

echo '########################### Installing Material-Black-Plum_1.8.1'
cd /usr/share/themes/
wget https://github.com/TheGetch/Debian_Themes/raw/master/Material-Black-Plum_1.8.1.zip
unzip Material-Black-Plum_1.8.1.zip
rm Material-Black-Plum_1.8.1.zip

echo '########################### Installing MB-Plum-Suru-GLOW'
cd /usr/share/icons/
wget https://github.com/TheGetch/Debian_Themes/raw/master/MB-Plum-Suru-GLOW_1.8.1.zip
unzip MB-Plum-Suru-GLOW_1.8.1.zip
rm MB-Plum-Suru-GLOW_1.8.1.zip

echo '########################### Downloading Background'
cd /usr/share/backgrounds/
wget https://github.com/TheGetch/Debian_Themes/raw/master/journey-wallpaper-blue.png

echo '########################### Updating icon cache'
gtk-update-icon-cache /usr/share/icons/MB-Plum-Suru-GLOW/

echo '########################### Setting Theme: This needs to be run as non-root/sudo'
xfconf-query -c xsettings -p /Net/ThemeName -s "Material-Black-Plum"

echo '########################### Setting Icons: This needs to be run as non-root/sudo'
xfconf-query -c xsettings -p /Net/IconThemeName -s "MB-Plum-Suru-GLOW"

echo '########################### Launching Greeter Settings'
lightdm-gtk-greeter-settings

echo '########################### Finished! Dont forget to manually change the background! (/usr/share/backgrounds/journey-wallpaper-blue.png) and to change the window's style in Window Manager'
