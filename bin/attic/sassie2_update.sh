echo updating sasmol on $(hostname -s)
if [[ $(hostname -s) = P6* ]] ; then
    cp /Users/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py.bk /Users/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py
    cd /Users/schowell/data/myPrograms/sassie/sassie_2.0/trunk
    svn update
    /Users/schowell/data/myPrograms/anaconda/bin/python remove_sassie.py
    /Users/schowell/data/myPrograms/anaconda/bin/python setup.py install

    # sudo cp /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/*.so /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk
    find /Users/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type d -exec chmod 755 {} \;
    find /Users/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type f -exec chmod a-w {} \;

else
    cp /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py.bk /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py
    cd /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk
    svn update
    /home/schowell/data/myPrograms/anaconda/bin/python remove_sassie.py
    /home/schowell/data/myPrograms/anaconda/bin/python setup.py install
    # sudo cp /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/*.so /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk
    find /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type d -exec chmod 755 {} \;
    find /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type f -exec chmod a-w {} \;
fi


cp /home/schowell/data/code/sassie_svn/sassie_2.0/trunk/sassie/calculate/sascalc_library/cpp_extension/sascalc_api.so /home/schowell/data/myPrograms/intel/intelpython35/envs/sassie_svn/lib/python2.7/site-packages/sassie/calculate/sascalc_library/cpp_extension/
