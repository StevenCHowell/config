sudo chown schowell:schowell -R /home/myPrograms/anaconda/lib/python2.7/site-packages
sudo chown schowell:schowell -R /home/myPrograms/sassie/sassie_2.0/trunk
sudo find /home/myPrograms/anaconda/lib/python2.7/site-packages/ -type d -exec chmod 755 {} \;
sudo find /home/myPrograms/anaconda/lib/python2.7/site-packages/ -type f -exec chmod 644 {} \;
