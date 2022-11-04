USER=schowell
REMOTEIP=128.164.237.26  # bioforce server

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
