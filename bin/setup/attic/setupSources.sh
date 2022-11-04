sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 044A3B98
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A252A784
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 614C4B38
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1378B444
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0624A220
sudo mv /etc/apt/sources.list /etc/apt/sources.list.BK
sudo cp /home/schowell/bin/comp_setup/sources.list /etc/apt/sources.list
