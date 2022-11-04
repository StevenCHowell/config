#s sudo apt-get install clamav-base/trusty-backports clamav/trusty-backports clamav-daemon/trusty-backports clamav-freshclam/trusty-backports clamtk/trusty-backports libclamav6/trusty-backports
sudo /etc/init.d/clamav-freshclam stop
sudo freshclam -v
sudo /etc/init.d/clamav-freshclam start
