
 
USER=schowell
mkdir ~/data
mkdir ~/data/myPrograms
sudo ln -s ~/data/myPrograms /home/myPrograms
ln -s /home/myPrograms/PlayOnLinux ~/.PlayOnLinux
sudo chown $USER:$USER /home/myPrograms/

OPTIONS="-e ssh -auv --progress --ignore-errors"

sudo add-apt-repository ppa:tombeckmann/ppa
sudo add-apt-repository ppa:ubuntu-x-swat/x-updates
sudo add-apt-repository ppa:kevin-mehall/pithos-daily
sudo add-apt-repository ppa:jfi/ppa
sudo add-apt-repository ppa:me-davidsansome/clementine

sudo apt-get -y -m update
sudo apt-get -y -m install synaptic

ln -s ~/Dropbox/backup/bin ~/bin
ln -s ~/Dropbox/backup/.xemacs        ~/.xemacs
ln -s ~/Dropbox/backup/.bashrc	      ~/.bashrc
ln -s ~/Dropbox/backup/.bash_aliases  ~/.bash_aliases
ln -s ~/Dropbox/backup/.profile       ~/.profile
rm -r ~/.ssh
ln -s ~/Dropbox/backup/.ssh           ~/.ssh
chmod 600 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys
ln -s ~/Dropbox/backup/.rsync_exclude ~/.rsync_exclude
ln -s ~/Dropbox/backup/gkrellm2 ~/.gkrellm2

sudo apt-get -y -m install pithos vim gparted xemacs21 gelemental texlive-full octave3.2 wxmaxima playonlinux clementine guake imagemagick krusader krename unrar kdiff3 gwoffice hardinfo gtkperf globs gkrellm python-scipy python-numpy openssh-server lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev

sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean

