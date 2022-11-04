USER=schowell
sudo ln -s ~/data/gwdata /home/gwdata
sudo ln -s ~/data/programs /home/programs
sudo ln -s ~/data/myPrograms /home/myPrograms
ln -s /home/myPrograms/PlayOnLinux ~/.PlayOnLinux
sudo chown $USER:$USER /home/gwdata/ /home/programs/

OPTIONS="-e ssh -auv --progress --ignore-errors"
REMOTEIP=128.164.237.26  # bioforce server
# REMOTEIP=128.164.236.132 # aurora

#\rsync $OPTIONS $USER@$REMOTEIP:/home/programs/ /home/programs/
#\rsync $OPTIONS $USER@$REMOTEIP:/home/gwdata/ /home/gwdata/

# sudo service cups stop
# sudo scp $USER@$REMOTEIP:/etc/cups/printers.conf /etc/cups/
# sudo scp $USER@$REMOTEIP:/etc/cups/ppd/* /etc/cups/ppd/*
# sudo chown root:root /etc/cups/ppd/*
# sudo chown root:lp /etc/cups/printers.conf
# sudo service cups start

sudo service cups stop
[[ -r /tmp/cups ]] && {
    rm -fr /tmp/cups
}
mkdir /tmp/cups
scp $USER@$REMOTEIP:/etc/cups/printers.conf.bak /tmp/cups/printers.conf
scp -r $USER@$REMOTEIP:/etc/cups/ppd /tmp/cups/

sudo mv -f /tmp/cups/printers.conf /etc/cups/
sudo mv -f /tmp/cups/ppd/*.ppd /etc/cups/ppd/
sudo chown -R root:root /etc/cups/ppd/
sudo chmod -R 644 /etc/cups/ppd/*.ppd
sudo chown root:lp /etc/cups/printers.conf
sudo chmod 644 /etc/cups/printers.conf
sudo service cups start

#sudo add-apt-repository ppa:tombeckmann/ppa #gwoffice
#sudo add-apt-repository ppa:ubuntu-x-swat/x-updates
#sudo add-apt-repository ppa:vincent-c/nevernote
sudo add-apt-repository ppa:indicator-multiload/stable-daily # indicator-multiload
sudo add-apt-repository ppa:kevin-mehall/pithos-daily # pithos
sudo add-apt-repository ppa:jfi/ppa # psensors
sudo add-apt-repository ppa:me-davidsansome/clementine # clementine
sudo add-apt-repository ppa:debfx/virtualbox # virtualbox
sudo add-apt-repository ppa:inkscape.dev/trunk # inkscape
# sudo add-apt-repository ppa:nvbn-rm/ppa # everpad
sudo add-apt-repository ppa:peterlevi/ppa # variety wallpaper switcher
sudo add-apt-repository ppa:cassou/emacs # emacs24
sudo add-apt-repository ppa:texlive-backports/ppa
sudo add-apt-repository ppa:eugenesan/ppa # radiotray
sudo add-apt-repository ppa:stebbins/handbrake-releases # handbrake
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 # spotify
sudo add-apt-repository ppa:niteshgupta16/ubuntuvibes # Guake & ubuntu tweaks
sudo add-apt-repository ppa:relan/exfat  # read micro SDXC cards

#PlayOnLinux
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E0F72778C4676186
sudo wget http://deb.playonlinux.com/playonlinux_quantal.list -O /etc/apt/sources.list.d/playonlinux.list
#skype
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
#sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ precise main" >> /etc/apt/sources.list.d/dropbox.list' 
sudo apt-get -y -m update
sudo apt-get -y -m install nautilus-dropbox 
dropbox start -i

ln -s ~/data/Dropbox ~/Dropbox
ln -s ~/Dropbox/backup/bin ~/bin
ln -s ~/Dropbox/backup/.xemacs        ~/.xemacs
ln -s ~/Dropbox/backup/.emacs.d       ~/.emacs.d
ln -s ~/Dropbox/backup/.bashrc	      ~/.bashrc
ln -s ~/Dropbox/backup/.bash_aliases  ~/.bash_aliases
ln -s ~/Dropbox/backup/.matlab        ~/.matlab
ln -s ~/Dropbox/backup/.dircolors     ~/.dircolors
ln -s ~/Dropbox/backup/.vmdrc         ~/.vmdrc
# ln -s ~/Dropbox/backup/.profile       ~/.profile  # looks like it trys to run .bashrc but not sure if it is needed
rm -rf ~/.ssh
ln -s ~/Dropbox/backup/.ssh           ~/.ssh
chmod 600 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys
ln -s ~/Dropbox/backup/.rsync_exclude ~/.rsync_exclude
ln -s ~/Dropbox/backup/gkrellm2 ~/.gkrellm2
#mkdir ~/.config/pianobar
#ln -s ~/Dropbox/backup/.pianobar-config ~/.config/pianobar/config

sudo ln -s /lib/x86_64-linux-gnu/libc.so.6 /lib64/libc.so.6 
sudo apt-get -y -m install fuse fuse-exfat exfat-utils ipython cURL synaptic variety kompare pithos vim gparted indicator-multiload gimp emacs24 xemacs21 gelemental vlc inkscape ubuntu-restricted-extras gparted playonlinux clementine guake psensor-common psensor hddtemp imagemagick krusader krename unrar kdiff3 hardinfo gtkperf globs gkrellm python-scipy python-numpy openssh-server lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev python-matplotlib chromium-browser handbrake-gtk openssh-client openssh-server libreoffice libreoffice-java-common graphviz #google-chrome-stable nixnote  gwoffice

sudo apt-get remove unity-lens-shopping

sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean

sudo /usr/share/doc/libdvdread4/install-css.sh

rm -r ~/Downloads/ ~/Documents/ ~/Pictures/ ~/Public/ ~/Videos/ ~/Music/
ln -s ~/data/Music ~/Music
ln -s ~/data/Documents ~/Documents
ln -s ~/data/Downloads ~/Downloads
ln -s ~/data/Public ~/Public
ln -s ~/data/Videos ~/Videos
ln -s ~/data/Pictures ~/Pictures
ln -s ~/data/Templates ~/Templates
ln -s ~/Dropbox/backup/.matlab ~/.matlab

# setup Mendeley
mkdir ~/.local/share/data/
mkdir ~/.local/share/data/Mendeley\ Ltd./
mv ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop/ ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop\ BACKUP/
ln -s ~/Dropbox/gw_phd/papers/mendeley/db ~/.local/share/data/Mendeley\ Ltd./Mendeley\ Desktop

sudo add-apt-repository "deb http://dl.google.com/linux/talkplugin/deb/ stable main"


sudo apt-get install texlive-full #octave wxmaxima 
