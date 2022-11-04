sudo find ./ -type f -print0 | xargs -0 sudo chmod 644
sudo find ./ -type d -print0 | xargs -0 sudo chmod 755 
