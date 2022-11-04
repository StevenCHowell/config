# gsettings set com.canonical.desktop.interface scrollbar-mode normal # turn on scoll bars  U14.04

sudo add-apt-repository ppa:pithos/ppa # pithos
sudo add-apt-repository ppa:bumblebee/stable # bumblebee for optimus graphics card
# sudo add-apt-repository ppa:jfi/ppa # psensors
# sudo add-apt-repository ppa:peterlevi/ppa # variety wallpaper switcher
# sudo add-apt-repository ppa:noobslab/themes # themes
# sudo add-apt-repository ppa:nifr/tilda # updated tilda

# curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# echo deb http://apt.syncthing.net/ syncthing release | sudo tee /etc/apt/sources.list.d/syncthing-release.list

sudo apt-get -y -m update

sudo apt-get -y -m install octave pithos vim gparted gimp emacs vlc inkscape imagemagick krusader krename kdiff3 hardinfo gtkperf globs make libsensors4-dev graphviz zsh cowsay fortune libdvdread4 syncthing openssh-server openssh-client terminator tilda git subversion gcc g++ gfortran gnuplot swig imwheel #pipelight-multi # fuse fuse-exfat exfat-utils

sudo apt-get install -y -m texlive-full #octave wxmaxima

# sudo apt-get remove unity-lens-shopping

# sudo pipelight-plugin --enable silverlight

sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean

# sudo /usr/share/doc/libdvdread4/install-css.sh


