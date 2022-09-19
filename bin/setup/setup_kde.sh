curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
wget -qO - https://hub.unity3d.com/linux/keys/public | sudo apt-key add -

add-apt-repository universe
add-apt-repository ppa:pipewire-debian/pipewire-upstream


pkcon refresh

apt install zsh tilda spotify-client emacs unityhub libfuse2 gimp inkscape terminator htop net-tools
apt install pipewire libspa-0.2-bluetooth pipewire-audio-client-libraries chntpw
apt --fix-broken install

pkcon update

systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire-media-session.service
systemctl --user restart pipewire
