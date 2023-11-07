#! /bin/bash

echo "Downloading Discord..."
wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"

echo "Extracting Discord..."
sudo tar -xvzf discord.tar.gz -C /opt

echo "Creating Discord command..."
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord

echo "Creating desktop entry..."
echo -e '[Desktop Entry]\nName=Discord\nExec=/usr/bin/Discord\nIcon=/opt/Discord/discord.png\nType=Application\nCategories=Network;InstantMessaging;' | sudo tee /usr/share/applications/discord.desktop

echo "Starting Discord..."
Discord