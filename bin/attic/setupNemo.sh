sudo add-apt-repository ppa:webupd8team/nemo
sudo add-apt-repository ppa:rabbitvcs/ppa
sudo apt-get update
sudo apt-get -y -m install nemo nemo-fileroller
sudo apt-get -y -m install nemo-compare nemo-dropbox nemo-media-columns nemo-pastebin nemo-seahorse nemo-share
sudo apt-get -y -m install nemo-rabbitvcs
sudo apt-get -y -m install nemo-terminal
killall nemo
sudo ln -s /usr/lib/x86_64-linux-gnu/libpython2.7.so.1 /usr/lib/libpython2.7.so.1
sudo ln -s /usr/lib/libpython2.7.so.1 /usr/lib/libpython2.7.so.1.0
sudo apt-get install dconf-tools
gsettings set org.gnome.desktop.background show-desktop-icons false
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
