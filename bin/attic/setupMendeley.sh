#s sudo dpkg -i /home/schowell/Dropbox/install/linux/mendeleydesktop*
#s mkdir /home/schowell/Dropbox/gw_phd/papers/mendeley/
#s mkdir /home/schowell/Dropbox/gw_phd/papers/mendeley/db/
#s mkdir /home/schowell/Dropbox/gw_phd/papers/mendeley/pdf/
mkdir ~/.local/share/data/
mkdir ~/.local/share/data/Mendeley\ Ltd./
mv ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop/ ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop\ BACKUP/
ln -s ~/Dropbox/gw_phd/papers/mendeley/db ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop
