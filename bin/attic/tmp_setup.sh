
 
USER=schowell
sudo chown $USER:$USER -R /home/gwdata/ /home/programs/ /home/myPrograms/

OPTIONS="-e ssh -auv --progress --ignore-errors"
REMOTEIP=128.164.237.26  # bioforce server

#sudo add-apt-repository ppa:tombeckmann/ppa                   #gwoffice
#sudo add-apt-repository ppa:ubuntu-x-swat/x-updates           #xorg ubuntu
sudo add-apt-repository ppa:indicator-multiload/stable-daily  #indicator multiload
sudo add-apt-repository ppa:kevin-mehall/pithos-daily         #pithos
#sudo add-apt-repository ppa:jfi/ppa                           #psensors 
#sudo add-apt-repository ppa:me-davidsansome/clementine        #clementine

sudo apt-get -y -m update
sudo apt-get -y -m install synaptic

ln -s ~/Dropbox/backup/bin ~/bin
ln -s ~/Dropbox/backup/.xemacs        ~/.xemacs
ln -s ~/Dropbox/backup/.bashrc	      ~/.bashrc
ln -s ~/Dropbox/backup/.bash_aliases  ~/.bash_aliases
ln -s ~/Dropbox/backup/.profile       ~/.profile
\rm -r ~/.ssh
ln -s ~/Dropbox/backup/.ssh           ~/.ssh
chmod 600 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys
#ln -s ~/Dropbox/backup/dir_sync.sh    ~/bin/dir_sync.sh
ln -s ~/Dropbox/backup/.rsync_exclude ~/.rsync_exclude
#ln -s ~/Dropbox/backup/gkrellm2 ~/.gkrellm2
#mkdir ~/.config/pianobar
#ln -s ~/Dropbox/backup/.pianobar-config ~/.config/pianobar/config

#sudo apt-get -y -m install pithos vim gparted indicator-multiload google-chrome-stable gimp xemacs21 gelemental vlc inkscape ubuntu-restricted-extras gparted texlive-full octave3.2 wxmaxima playonlinux clementine guake psensor-common psensor hddtemp imagemagick krusader krename nixnote unrar kdiff3 gwoffice hardinfo gtkperf globs gkrellm python-scipy python-numpy openssh-server lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev

#sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean
