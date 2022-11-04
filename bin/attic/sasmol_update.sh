# if [ `hostname` == "P630552" ] ; then

echo updating sasmol on $(hostname -s)
if [[ $(hostname -s) = P6* ]] ; then
    rm -rf /Users/schowell/data/myPrograms/anaconda3/envs/zm27/lib/python2.7/site-packages/sasmol*
    cd /Users/schowell/data/code/zazmol/
    rm -rf /Users/schowell/data/code/zazmol/build/*
    /Users/schowell/data/myPrograms/anaconda3/envs/zm27/bin/python setup.py install
else
    rm -rf /home/schowell/data/myPrograms/anaconda3/envs/zm27/lib/python2.7/site-packages/sasmol*
    cd /home/schowell/data/code/zazmol/
    rm -rf /home/schowell/data/code/zazmol/build/*
    /home/schowell/data/myPrograms/anaconda3/envs/zm27/bin/python setup.py install
fi
