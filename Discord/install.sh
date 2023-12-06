#!/bin/bash

if [ -d "/opt/Discord" ]; then
    echo "Discord directory exists. Removing it..."
    sudo rm -rf /opt/{Discord,discord}
fi

echo "Downloading Discord..."
wget -O discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
if [ $? -ne 0 ]; then
    echo "Failed to download Discord. Exiting."
    exit 1
fi

echo "Extracting Discord..."
sudo tar -xvzf discord.tar.gz -C /opt
if [ $? -ne 0 ]; then
    echo "Failed to extract Discord. Exiting."
    rm discord.tar.gz
    exit 1
fi

echo "Creating Discord command..."
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord
if [ $? -ne 0 ]; then
    echo "Failed to create Discord command. Exiting."
    sudo rm -rf /opt/Discord
    rm discord.tar.gz
    exit 1
fi

echo "Creating desktop entry..."
echo -e '[Desktop Entry]\nName=Discord\nExec=/usr/bin/Discord\nIcon=/opt/Discord/discord.png\nType=Application\nCategories=Network;InstantMessaging;' | sudo tee /usr/share/applications/discord.desktop
if [ $? -ne 0 ]; then
    echo "Failed to create desktop entry. Exiting."
    sudo rm /usr/bin/Discord
    sudo rm -rf /opt/Discord
    rm discord.tar.gz
    exit 1
fi

echo "Cleaning up..."
rm discord.tar.gz

echo "Starting Discord..."
Discord
