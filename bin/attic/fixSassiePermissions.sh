chown root:root -R /usr/local/lib/python2.7/dist-packages
find /usr/local/lib/python2.7/dist-packages/ /usr/local/bin/ -type d -exec chmod 755 {} \;
find /usr/local/lib/python2.7/dist-packages/ -type f -exec chmod 644 {} \;
find /usr/local/bin/ -type f -exec chmod 755 {} \;
