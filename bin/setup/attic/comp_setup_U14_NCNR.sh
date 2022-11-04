gsettings set com.canonical.desktop.interface scrollbar-mode normal # turn on scoll bars  U14.04

sudo add-apt-repository ppa:pithos/ppa # pithos
sudo add-apt-repository ppa:jfi/ppa # psensors
sudo add-apt-repository ppa:peterlevi/ppa # variety wallpaper switcher

sudo apt-get -y -m update

ln -s ~/Dropbox/backup/.xemacs        ~/.xemacs
ln -s ~/Dropbox/backup/.emacs.d       ~/.emacs.d
ln -s ~/Dropbox/backup/.bash_profile  ~/.bash_profile
ln -s ~/Dropbox/backup/.bashrc	      ~/.bashrc
ln -s ~/Dropbox/backup/.bash_aliases  ~/.bash_aliases
ln -s ~/Dropbox/backup/.matlab        ~/.matlab
ln -s ~/Dropbox/backup/.dircolors     ~/.dircolors
ln -s ~/Dropbox/backup/.vmdrc         ~/.vmdrc
ln -s Dropbox/backup/aspell_personal_dictionary/.aspell.en.prepl .aspell.en.prepl
ln -s Dropbox/backup/aspell_personal_dictionary/.aspell.en.pws .aspell.en.pws
ln -s ~/Dropbox/backup/.rsync_exclude ~/.rsync_exclude

# sudo ln -s /lib/x86_64-linux-gnu/libc.so.6 /lib64/libc.so.6 
sudo apt-get -y -m install ipython cURL synaptic variety pithos vim gparted indicator-multiload gimp emacs24 xemacs21 gelemental vlc inkscape ubuntu-restricted-extras playonlinux guake psensor-common psensor hddtemp imagemagick krusader krename unrar kdiff3 hardinfo gtkperf globs gkrellm python-scipy python-numpy lm-sensors make gcc libsensors4-dev libgtk2.0-dev libgconf2-dev python-matplotlib chromium-browser openssh-client libreoffice libreoffice-java-common graphviz cowsay fortune unity-tweak-tool gnome-tweak-tool libdvdread4 rar # pipelight-multi # fuse fuse-exfat exfat-utils 

# sudo apt-get remove unity-lens-shopping

# sudo pipelight-plugin --enable silverlight
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

sudo apt-get -y -m update && sudo apt-get -y -m upgrade && sudo apt-get -y -m autoremove && sudo apt-get -y -m autoclean

sudo /usr/share/doc/libdvdread4/install-css.sh

ln -s ~/Dropbox/backup/.matlab ~/.matlab

sudo apt-get install texlive-full #octave wxmaxima 


