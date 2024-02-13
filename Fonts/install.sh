cd fonts
sudo cp -f *.* /usr/share/fonts/ && sudo fc-cache -f -v > /dev/null 2>&1
echo "Fonts installed! :)"