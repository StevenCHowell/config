gsettings set com.canonical.desktop.interface scrollbar-mode normal # turn on scoll bars  U14.04

sudo add-apt-repository ppa:pithos/ppa # pithos
sudo add-apt-repository ppa:jfi/ppa # psensors
sudo add-apt-repository ppa:peterlevi/ppa # variety wallpaper switcher
sudo add-apt-repository ppa:noobslab/themes # themes
sudo add-apt-repository ppa:nifr/tilda # updated tilda

curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo deb http://apt.syncthing.net/ syncthing release | sudo tee /etc/apt/sources.list.d/syncthing-release.list

sudo apt-get -y -m update

sudo apt-get -y -m install ipython cURL synaptic variety pithos vim gparted indicator-multiload gimp emacs24 gelemental vlc inkscape ubuntu-restricted-extras guake psensor-common psensor hddtemp imagemagick krusader krename unrar kdiff3 hardinfo gtkperf globs gkrellm python-scipy python-numpy lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev python-matplotlib chromium-browser openssh-client libreoffice libreoffice-java-common graphviz cowsay fortune unity-tweak-tool gnome-tweak-tool libdvdread4 rar syncthing openssh-server openssh-client terminator tilda delorean-dark subversion gcc g++ gfortran gnuplot-X11 tcsh swig tcl8.4 tcl8.4-dev tk8.4 tk8.4-dev libfftw3-3 libfftw3-dev libstdc++5 python-numpy python-scipy python-tk python-all-dev python-gnuplot imwheel #pipelight-multi # fuse fuse-exfat exfat-utils 

# sudo apt-get remove unity-lens-shopping

# sudo pipelight-plugin --enable silverlight
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean

sudo /usr/share/doc/libdvdread4/install-css.sh

sudo apt-get install texlive-full #octave wxmaxima 


