# if [ `hostname` == "P630552" ] ; then

echo updating sasmol on $(hostname -s)
if [[ $(hostname -s) = P6* ]] ; then
    cd ~/data/myPrograms/sasmol/
    git pull
    ~/data/myPrograms/anaconda/bin/python setup.py install
    find ~/data/myPrograms/anaconda/lib/python2.7/site-packages/sasmol/ -type d -exec chmod 755 {} \;
    find ~/data/myPrograms/anaconda/lib/python2.7/site-packages/sasmol/ -type f -exec chmod a-w {} \;
else
    cd ~/data/myPrograms/sasmol/
    git pull
    ~/data/myPrograms/anaconda/bin/python setup.py install
    find ~/data/myPrograms/anaconda/lib/python2.7/site-packages/sasmol/ -type d -exec chmod 755 {} \;
    find ~/data/myPrograms/anaconda/lib/python2.7/site-packages/sasmol/ -type f -exec chmod a-w {} \;
fi
