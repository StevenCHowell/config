if [ `hostname` == "P630552" ] ; then
    cp /Users/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py.bk /Users/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py
    cd /Users/myPrograms/sassie/sassie_2.0/trunk
    svn update
    sudo -E /Users/myPrograms/anaconda/bin/python remove_sassie.py
    sudo -E /Users/myPrograms/anaconda/bin/python setup.py install
    # sudo cp /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/*.so /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/simulate/monte_carlo/monte_carlo_utilities/double_stranded_nucleic/
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages
    # sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk
    # find /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type d -exec chmod 755 {} \;
    # find /home/schowell/data/myPrograms/anaconda/lib/python2.7/site-packages/sassie/ -type f -exec chmod a-w {} \;
else
    # cp /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py.bk /home/schowell/data/myPrograms/sassie/sassie_2.0/trunk/sassie/util/sasconfig.py
    cd /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk
    svn update
    cd /home/schowell/data/code/pylib/sassie_2_na/util/insert_dna_dihedral/
    cp mask.c /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk/sassie/sasmol/extensions/mask/mask.c
    cp dihedral_monte_carlo.py /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk/sassie/simulate/monte_carlo/monomer/dihedral_monte_carlo.py
    cp dihedral_rotate.py /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk/sassie/simulate/monte_carlo/monomer/dihedral_rotate.py
    cd /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk
    sudo -E /usr/bin/python remove_sassie.py
    sudo -E /usr/bin/python setup.py install
    sudo -E chown schowell:schowell -R /usr/local/lib/python2.7/dist-packages
    sudo -E chown schowell:schowell -R /home/schowell/data/myPrograms/sassie/sassie_1.0/trunk
    echo finished install
    sudo find /usr/local/lib/python2.7/dist-packages/sassie/ -type d -exec chmod 755 {} \;
    echo changed directory permissions 
    sudo find /usr/local/lib/python2.7/dist-packages/sassie/ -type f -exec chmod a-w {} \;
    echo changed file permissions
    sudo find /usr/local/lib/python2.7/dist-packages/sassie/ -type f -exec chmod a+r {} \;
fi
