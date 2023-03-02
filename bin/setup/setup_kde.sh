
# sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
# wget -qO - https://hub.unity3d.com/linux/keys/public | sudo apt-key add -

add-apt-repository universe  # pcloud
# add-apt-repository ppa:pipewire-debian/pipewire-upstream

pkcon refresh

apt install zsh tilda emacs libfuse2 gimp inkscape terminator htop net-tools fortune cowsay lolcat ssh fzf kio-gdrive korganizer kdepim-addons kdiff3
# apt install spotify-client unityhub
# apt install pipewire libspa-0.2-bluetooth pipewire-audio-client-libraries chntpw
apt --fix-broken install

pkcon update

# systemctl --user daemon-reload
# systemctl --user --now disable pulseaudio.service pulseaudio.socket
# systemctl --user mask pulseaudio
# systemctl --user --now enable pipewire-media-session.service
# systemctl --user restart pipewire

# spotify snap
snap install spotify

# # spotify deb
# curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# pkcon refresh
# apt install spotify-client

# Google Integration
# https://www.lorenzobettini.it/2021/09/accessing-google-online-account-from-gnome-and-kde/

