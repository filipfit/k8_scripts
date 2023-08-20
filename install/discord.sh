#! /usr/bin/bash
# taken from: https://itslinuxfoss.com/how-to-install-and-use-discord-on-ubuntu-20-04/

sudo apt update
sudo apt install -y gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb
