
 
USER=xraylab
sudo ln -s ~/data/gwdata /home/gwdata
sudo ln -s ~/data/programs /home/programs
sudo chown $USER:$USER /home/gwdata/ /home/programs/

OPTIONS="-e ssh -auv --progress --ignore-errors"
REMOTEIP=128.164.237.26  # bioforce server

\rsync $OPTIONS $USER@$REMOTEIP:/home/programs/ /home/programs/
\rsync $OPTIONS $USER@$REMOTEIP:/home/gwdata/ /home/gwdata/

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

sudo add-apt-repository ppa:indicator-multiload/stable-daily # indicator-multiload
sudo add-apt-repository ppa:kevin-mehall/pithos-daily # pithos
sudo add-apt-repository ppa:jfi/ppa # psensors
sudo add-apt-repository ppa:me-davidsansome/clementine # clementine
sudo add-apt-repository ppa:debfx/virtualbox # virtualbox
sudo add-apt-repository ppa:inkscape.dev/trunk # inkscape
sudo add-apt-repository ppa:texlive-backports/ppa

sudo apt-get -y -m update
sudo apt-get -y -m install synaptic nautilus-dropbox kompare pithos vim gparted indicator-multiload gimp emacs23 xemacs21 gelemental vlc inkscape ubuntu-restricted-extras playonlinux guake psensor-common psensor hddtemp imagemagick krusader krename unrar kdiff3 hardinfo gtkperf globs python-scipy python-numpy openssh-server lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev python-matplotlib # google-chrome-stable nixnote  gwoffice

sudo apt-get remove unity-lens-shopping
sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean
sudo /usr/share/doc/libdvdread4/install-css.sh

dropbox start -i

ln -s ~/Dropbox/backup/bin ~/bin
ln -s ~/Dropbox/backup/.xemacs        ~/.xemacs
ln -s ~/Dropbox/backup/.emacs.d       ~/.emacs.d
ln -s ~/Dropbox/backup/.bashrc	      ~/.bashrc
ln -s ~/Dropbox/backup/.bash_aliases  ~/.bash_aliases
ln -s ~/Dropbox/backup/.rsync_exclude ~/.rsync_exclude
\rm -r ~/.ssh
ln -s ~/Dropbox/backup/.ssh           ~/.ssh
chmod 600 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys

rm -r ~/Documents/ ~/Pictures/ ~/Public/ ~/Videos/ ~/Music/