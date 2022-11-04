
 
USER=schowell
sudo ln -s ~/data/gwdata /home/gwdata
sudo ln -s ~/data/programs /home/programs
sudo ln -s ~/data/myPrograms /home/myPrograms
ln -s /home/myPrograms/PlayOnLinux ~/.PlayOnLinux
sudo chown $USER:$USER /home/gwdata/ /home/programs/

OPTIONS="-e ssh -auv --progress --ignore-errors"
REMOTEIP=128.164.237.26  # bioforce server

#\rsync $OPTIONS $USER@$REMOTEIP:/home/programs/ /home/programs/
#\rsync $OPTIONS $USER@$REMOTEIP:/home/gwdata/ /home/gwdata/

# sudo service cups stop
# sudo scp $USER@$REMOTEIP:/etc/cups/printers.conf /etc/cups/
# sudo scp $USER@$REMOTEIP:/etc/cups/ppd/* /etc/cups/ppd/*
# sudo chown root:root /etc/cups/ppd/*
# sudo chown root:lp /etc/cups/printers.conf
# sudo service cups start

sudo service cups stop
[[ -r /tmp/cups ]] && {
    rm -fr /tmp/cups
}
mkdir /tmp/cups
scp $USER@$REMOTEIP:/etc/cups/printers.conf.bak /tmp/cups/printers.conf
scp -r $USER@$REMOTEIP:/etc/cups/ppd /tmp/cups/

sudo mv -f /tmp/cups/printers.conf /etc/cups/
sudo mv -f /tmp/cups/ppd/*.ppd /etc/cups/ppd/
sudo chown -R root:root /etc/cups/ppd/
sudo chmod -R 644 /etc/cups/ppd/*.ppd
sudo chown root:lp /etc/cups/printers.conf
sudo chmod 644 /etc/cups/printers.conf
sudo service cups start

