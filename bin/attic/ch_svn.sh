sudo svnadmin create /home/svn/$1
sudo chown -R www-data:subversion /home/svn/$1
sudo chmod -R g+rws /home/svn/$1
