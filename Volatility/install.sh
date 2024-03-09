#!/bin/bash
wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
unzip volatility_2.6_lin64_standalone.zip
sudo mv volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/local/bin/volatility
sudo chmod +xr /usr/local/bin/volatility
volatility -h