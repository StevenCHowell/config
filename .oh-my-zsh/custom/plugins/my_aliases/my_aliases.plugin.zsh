# added for Anaconda python
# export PATH=$HOME/data/myPrograms/anaconda/bin:$PATH
# export PATH=$HOME/data/myPrograms/anaconda3/bin:$PATH
export PATH=/snap/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/schowell/data/myPrograms/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/schowell/data/myPrograms/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/schowell/data/myPrograms/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/schowell/data/myPrograms/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# alias update="sudo apt-get update && sudo apt-get -y -m dist-upgrade"
alias update="sudo apt update && sudo apt -y -m upgrade"
alias update_clean="sudo apt update && sudo apt -y -m dist-upgrade && sudo apt -y autoremove && sudo apt -y autoclean"

export EDITOR="emacs -nw"
export LESS="-R"

umask 027
set notify
set history=500

alias source_beet="source ~/Music/venv/bin/activate"

# alias crysol="crysol -lm 50 -fb 18" #xray default
# alias crysol="crysol -lm 15 -fb 18" #my default (lm is important for MASSHA but takes much longer)
alias crysol="crysol -lm 10 -fb 18 -sm 0.2" #my default (lm = Q_max * D_max / pi, and it is not accurate beyond 0.2)
alias foxs="foxs -q 0.2 -s 200"
alias scatter="java -jar $HOME/data/myPrograms/scatter3a_jar/scatter3.jar &"
alias amd="sudo amdcccle"
alias lmake="make&&make"
alias du="du -sh * | sort -h"
alias svn_id='svn propset svn:keywords "Id"'
alias disks='sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'

# From Joseph
alias lsd='ls -lt | grep drwx | head'
alias cdsm='cd ~/data/myPrograms/sasmol/'
alias cds2='cd ~/data/codesassie_svn/sassie_2.0/'

eogn () { for i; do eog -n "$i" & done; }

# ls aliases
if [[ ( `hostname -s` = P630552 ) || ( `hostname -s` = P643652 ) || (`hostname -s` = P641697 ) ]]; then
    alias l='ls -1rt'
    alias l.="ls -lhtrdF .*"
    alias sl="ls"
    alias ls="ls -F"
    alias ll="ls -ltrhF"
    alias la="ls -a -ltrhF"
    alias lss="ls -lShr"
    alias lsh="ls -lt | head"
    alias lst="ls -lrt | tail"
    alias lsa="ls -lrta | tail"
    alias rm="grm -i"
    alias ii="export PATH=/opt/intel/intelpython35/bin:$PATH"
else
    alias l='ls -1rt --color=tty'
    alias l.="ls -lhtrdF .* --color=tty"
    alias sl="ls --color=tty"
    alias ls="ls -FX --color=tty"
    alias ll="ls -ltrhF --color=tty"
    alias la="ls -a -ltrhF --color=tty"
    alias lss="ls -lShr --color=tty"
    alias lsh="ls -lt --color=tty | head"
    alias lst="ls -lrt --color=tty | tail"
    alias lsa="ls -lrta --color=tty | tail"
    alias dir='dir --color=tty'
    alias rm="rm -ir"
    alias ii="export PATH=$HOME/data/myPrograms/intelpython35/bin:$PATH"
fi

# for OSPRay imcompatibility bug in VMD
if [[ ( `hostname -s` = thor ) ]]; then
    export VMDNOOSPRAY=1
fi

alias md="mkdir -p"
alias rd="rmdir"
alias df="df -h"
alias mv="mv -i"

# alias sed='sed -E'   # set sed to modify files in place
alias dir="lt"
alias lock="gnome-screensaver-command -l"
# alias cd..="cd .."
# alias cd...="cd ../.."
# alias cd....="cd ../../.."
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
alias xemacs="xemacs21"
alias topme="htop -u schowell"

# clamav
alias fullscan="sudo clamscan -ir --exclude-dir=^/sys --exclude-dir=^/dev --exclude-dir=^/proc /"

# pushd shortcuts
alias docs="pushd $HOME/data/code/sassie_svn/sassie_docs/simulate/torsion_angle_monte_carlo/"
alias sassie="pushd $HOME/data/code/sassie_svn/sassie_2.0/trunk/sassie/simulate/monte_carlo/"
alias dnapaper="pushd $HOME/data/code/sassie_svn/papers/ds_dna_method_2015/"
alias paper="pushd $HOME/data/code/paper_sas_modeling/"
alias diss="pushd $HOME/data/code/pylib/sassie_2_dna/dissertation/"
alias lib-sassie="pushd /usr/local/lib/python2.6/dist-packages/sassie/"
alias phage="pushd $HOME/Dropbox/gw_phd/NIST/0811NIST/datafit/"
alias xraylab="pushd $HOME/Dropbox/gw_phd/xraylab/"
alias text="pushd /windows/Documents\ and\ Settings/Steve/My\ Documents/Text/"
alias matlib="pushd $HOME/Dropbox/gw_phd/code/matlib/"
alias pylib="pushd $HOME/Dropbox/gw_phd/code/pylib/"
alias android="pushd $HOME/Dropbox/gw_phd/android/"
alias protocol="pushd $HOME/Dropbox/gw_phd/stevesGroup/protocol/"
alias notes="pushd $HOME/Dropbox/gw_phd/xraylab/experimentnotes/stevenHowell"

alias kompare="kdiff3"
alias grep='grep --color=auto -n'
alias cls="clear"
alias mv="mv -iv"
alias cp="cp -iva"
alias df='df -k'

#Print Commands
#alias lpr="lpr -Plj4250"
#alias lprc="\lpr -PXerox8560DN"
#alias lprc2="\lpr -PLexmarkC534dn"
#alias lprbw="\lpr -PLaserjet9000"
#alias lpq="lpq -Plj4250"
#alias lpqc="lpq -PPhaser8200"

# Compile & Debug C
# alias val="valgrind --leak-check=full -v --show-reachable=yes"
alias val="valgrind --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
alias valv="valgrind --verbose --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
alias gcc='gcc -ansi -std=c99 -pedantic -Wall -g'

# experiments
alias nx-sns="$HOME/data/myPrograms/NX/bin/nxclient $HOME/Dropbox/gw_phd/experiments/1303sns/analysis.nxs&"

# ipython
alias tipython="ipython --pylab"
alias gipython="ipython notebook --pylab=inline"
# alias apython="$HOME/data/myPrograms/anaconda/bin/python"
# alias anosetests='$HOME/data/myPrograms/anaconda/bin/nosetests'

# ssh
alias backup="ssh -C schowell@129.6.121.16"
alias gibbs="ssh -C schowell@129.6.123.230"
alias onsager="ssh -C schowell@129.6.121.86"
alias compute0="ssh  -C schowell@129.6.121.26"
alias compute1="ssh  -C schowell@129.6.121.18"
alias root_onsager="ssh -C root@129.6.121.86"
alias entropy="ssh schowell@entropy.chem.utk.edu"
alias ventropy="ssh -C schowell@192.168.56.101"
alias mentropy="ssh -C schowell@129.6.123.223"
alias mobile="ssh -C schowell@129.6.121.53"
alias ncnr="ssh -C schowell@129.6.123.28"
alias ian="ssh -C schowell@129.6.121.112"
alias odin="ssh -C schowell@129.6.123.226"
alias sam="ssh -C schowell@129.6.123.57"
alias ocho="ssh -C schowell@129.6.121.114"
alias book="ssh -C schowell@129.6.123.27"
alias can="ssh -C schowell@129.6.121.5"
alias danse="ssh -C cpc@danse.chem.utk.edu"
alias sns="ssh -C steven62@analysis.sns.gov"
alias benchtop="ssh -C schowell@192.168.1.119"
alias loki="ssh -C schowell@161.253.36.74"
alias aurora="ssh -C schowell@192.168.62.107"
alias charge="ssh -C xraylab@161.253.36.181"
alias thor="ssh -C schowell@192.168.62.99"
alias freenas="ssh -C schowell@192.168.62.63"
alias sweb="ssh -C schowell@sassie-web.chem.utk.edu"
alias xray="ssh -C schowell@161.253.36.12"
alias xraybot="ssh -C mar345@128.164.238.78"
alias office="ssh -C schowell@128.164.237.233"
alias colonial="ssh -C schowell@login.colonialone.gwu.edu"
#alias synology="ssh schowell@169.254.213.218"
alias synology="ssh schowell@192.168.62.62"
alias eads="ssh schowell@192.168.1.214"

# with X
alias gibbs-x="ssh -XC schowell@129.6.123.230"
alias onsager-x="ssh -XC schowell@129.6.121.86"
alias entropy-x="ssh -XC schowell@entropy.chem.utk.edu"
alias mentropy="ssh -XC schowell@129.6.123.223"
alias sns-x="ssh -XC steven62@analysis.sns.gov"
alias benchtop-x="ssh -XC schowell@192.168.1.119"
alias loki-x="ssh -XC schowell@161.253.36.74"
alias aurora-x="ssh -XC schowell@161.253.36.27"
alias charge-x="ssh -XC xraylab@161.253.36.181"
alias ncnr-x="ssh -XC schowell@129.6.123.28"
alias odin-x="ssh -XC schowell@129.6.123.226"
alias thor-x="ssh -XC schowell@192.168.62.99"
alias sweb-x="ssh -XC schowell@sassie-web.chem.utk.edu"
alias xray-x="ssh -XC schowell@161.253.72.20"
alias xraybot-x="ssh -XC mar345@128.164.238.78"
alias office-x="ssh -XC schowell@128.164.237.233"
alias colonial-x="ssh -XC schowell@login.colonialone.gwu.edu"

# slow
alias gibbs-s="mosh schowell@129.6.123.230"
alias onsager-s="mosh schowell@129.6.121.86"
alias entropy-s="mosh schowell@entropy.chem.utk.edu"
alias sns-s="mosh steven62@analysis.sns.gov"
alias benchtop-s="mosh schowell@192.168.1.119"
alias loki-s="mosh schowell@161.253.36.74"
alias aurora-s="mosh schowell@161.253.36.27"
alias charge-s="mosh xraylab@161.253.36.181"
alias ncnr-s="mosh schowell@129.6.123.28"
alias odin-s="mosh schowell@129.6.123.226"
alias thor-s="mosh schowell@192.168.62.99"
alias sweb-s="mosh schowell@sassie-web.chem.utk.edu"
alias xray-s="mosh schowell@161.253.36.12"
alias xraybot-s="mosh mar345@128.164.238.78"
alias office-s="mosh schowell@128.164.237.233"
alias colonial-s="mosh schowell@login.colonialone.gwu.edu"

# alias school="ssh schowell@helios.phys.gwu.edu"
# alias school="ssh schowell@128.164.237.1"

alias rsync='rsync -e ssh -rltDuv -O --modify-window=1 --progress --no-group --ignore-errors'
# alias rsync='rsync -e ssh -auv --progress --ignore-errors -utvl'
alias mpage='mpage -H -4 -bLetter -f -c'
alias ps2pdf='ps2pdf -dOptimize=true -dEPSCrop -dAutoRotatePages=/None -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dUseFlateCompression=true'
alias mountiso='mount -o loop -t iso9660 -r'

alias wing32='/usr/bin/wing5.0'

# ~~tar~~
#c create a new archive
#x extract files from archive
#v verbosely list files which are processed
#f following is the archive file name
#z filter the archive through gzip
#j filter the archive through bzip2
alias tar="\tar cvzf"
alias tar2="\tar cvfj"
alias untar="\tar xvfz"
alias untar2="\tar xvfj"

#alias cvslapper_login='cvs -d :ssh:xiangyun@slapper.apam.columbia.edu:/u24/local/cvsroot login'
#alias cvsslapper='cvs -d /u24/local/cvsroot/programs'
#alias cvspap='cvs -d /u24/local/cvsroot/papers '
alias xfig='xfig -bg white -centimeters -pwidth 25.8 -pheight 19.7'
alias xdvi='xdvi -bg white -s 10'

#export MATLAB_JAVA=/usr/lib/jvm/java-6-openjdk/jre;
alias tmatlab='matlab -nodesktop -nosplash'
alias gmatlab='matlab -nosplash -desktop &'
alias oldtmatlab='$HOME/data/myPrograms/matlab2010b/bin/matlab -nodesktop -nosplash'
alias oldgmatlab='$HOME/data/myPrograms/matlab2010b/bin/matlab -nosplash -desktop &'
## For 32-bit matlab on 64-bit OS ##
#alias tmatlab='matlab -glnx86 -nosplash -nodesktop'
#alias gmatlab='matlab -glnx86 -nosplash -desktop &'


alias xmatlab='\matlab &'
#alias sedfit='wine /home/programs/wine/drive_c/sedfit/sedfit.exe'
#alias JabRef='java -jar /home/programs/download/JabRef-2.3.1.jar'
#alias cabaretstage='/home/programs/cabaretstage/cabaretstage.sh'

# linux programs
#alias raw='python $HOME/data/myPrograms/bioxtasraw/src/RAW.py &'
#alias mathematica='$HOME/data/myPrograms/Mathematica9/bin/Mathematica'
#alias zotero='$HOME/data/myPrograms/Zotero_linux-x86_64/zotero'
alias cb='java -jar $HOME/data/myPrograms/ColorOracle.jar'

# My wine programs
# alias foxit='/usr/share/playonlinux/playonlinux --run "Foxit"'
alias word='/usr/share/playonlinux/playonlinux --run "Microsoft Word 2010"'
alias excel='/usr/share/playonlinux/playonlinux --run "Microsoft Excel 2010"'
alias ppt='/usr/share/playonlinux/playonlinux --run "Microsoft Powerpoint 2010"'
alias onenote='/usr/share/playonlinux/playonlinux --run "Microsoft OneNote 2010"'

# Set global environment variables
CVS_RSH="ssh"; export CVS_RSH
#export CVSROOT=$HOME/data/cvsRepo
export CVSROOT=:ext:schowell@128.164.238.4:$HOME/data/cvsRepo
export SVNROOT="svn+ssh://schowell@161.253.36.7/home/svn"
export CVSEDITOR="emacs -nw --no-init-file"
export TEXINPUTS=.:$HOME/paper/texpkg//::
export BSTINPUTS=.:$HOME/paper/texpkg//:
export BIBINPUTS=.:$HOME/paper/bib//:

export AUTHOR="Steven C. Howell"
export AUTHOR_EMAIL="schowell@gwmail.gwu.edu"

export XENVIRONMENT=$HOME/.Xdefaults
export PATH="$HOME/data/myPrograms/bin:$HOME/data/myPrograms/atsas/bin:$HOME/data/myPrograms/NAMD:$HOME/bin:/usr/local/cuda/bin:$PATH"

#alias anaconda="export PATH=$HOME/data/myPrograms/anaconda/bin:$PATH"
# alias aa="export PATH=$HOME/data/myPrograms/anaconda/bin:$PATH"
# alias enthought="export PATH=$HOME/Library/Enthought/Canopy_64bit/User/bin:$PATH"

#PATH=`echo $PATH | tr ':' '\n' | sort -bu | paste -s -d:` # this sorts removing duplicates but messes up the order

export MATLABPATH=$HOME/Dropbox/gw_phd/code/matlib/:$HOME/Dropbox/gw_phd/code/matlib/atoms:$HOME/Dropbox/gw_phd/code/matlib/electrostatics:$HOME/Dropbox/gw_phd/code/matlib/fluidynamics:$HOME/Dropbox/gw_phd/code/matlib/graphics:$HOME/Dropbox/gw_phd/code/matlib/imported:$HOME/Dropbox/gw_phd/code/matlib/iqgetx:$HOME/Dropbox/gw_phd/code/matlib/sasa:$HOME/Dropbox/gw_phd/code/matlib/spectroscopy:$HOME/Dropbox/gw_phd/code/matlib/sqtools:$HOME/Dropbox/gw_phd/code/matlib/osmotic:$HOME/Dropbox/gw_phd/code/matlib/fileio:$HOME/Dropbox/gw_phd/code/matlib/curvefit:$HOME/Dropbox/gw_phd/code/matlib/howell:$HOME/Dropbox/gw_phd/code/matlib/imported/GUILayout-v1p10:$HOME/Dropbox/gw_phd/code/matlib/imported/GUILayout-v1p10/Patch:$HOME/Dropbox/gw_phd/code/matlib/imported/GUILayout-v1p10/layoutHelp:$HOME/Dropbox/gw_phd/code/matlib/howell/SBMLToolbox-4.1.0/toolbox:$HOME/Dropbox/gw_phd/code/matlib/imported/specreader:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/analysis:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/doc:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/examples:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/matlabimtools:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/pilatus_1mf:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/readcbf:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/utilities:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/xrayrefraction:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/pilatus_1mf/flatfield:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/pilatus_1mf/gapfill:$HOME/Dropbox/gw_phd/code/matlib/howell/GIXSGUI_1p4p0_20120815/GIXSGUI/pilatus_1mf/mask:$HOME/Dropbox/gw_phd/code/matlib/howell/export_fig:$HOME/Dropbox/gw_phd/code/matlib/howell/R9.4/:$HOME/Dropbox/gw_phd/code/matlib/howell/matdcd-1.0/:$HOME/Dropbox/gw_phd/code/matlib/howell/myaa/:$HOME/Dropbox/gw_phd/code/matlib/howell/ojwoodford-export_fig-165dc92/

#. /home/programs/itt/idl/bin/idl_setup.bash
#IDL_PATH=+$IDL_DIR/lib
#export IDL_PATH=${IDL_PATH}:+$HOME/codedev/idllib:$HOME/codedev/pdftool
#export IDL_PATH=`echo $IDL_PATH | tr ':' '\n' | sort -bu | paste -s -d:`

#xrdb -load $HOME/.Xdefaults

#s define python path

#s Add modules to the python path
#s alias mypython="export PYTHONPATH=$HOME/data/code/pylib/:$PYTHONPATH"              #my pylib
#s export PYTHONPATH=$HOME/data/code/pylib/:$HOME/Dropbox/gw_phd/code/pylib/:$PYTHONPATH              #my pylib
#s export PYTHONPATH=$HOME/data/myPrograms/imp_build/lib/:$PYTHONPATH              #imp
#s export PYTHONPATH=$HOME/Dropbox/gw_phd/code/pylib/myFuncs/:$PYTHONPATH      #my functions
#s export PYTHONPATH=$HOME/Dropbox/gw_phd/code/pylib/swampy-2.1.1/:$PYTHONPATH #swampy
#s export PYTHONPATH=$HOME/Dropbox/gw_phd/code/pylib/pyXS_nsls/:$PYTHONPATH    #pyXS
#s export PYTHONPATH=$HOME/data/code/sassie_svn/:$PYTHONPATH                     #sassie
#s export PYTHONPATH=$HOME/Dropbox/gw_phd/code/pylib/sassie/:$PYTHONPATH     #sassie

#s export PYTHONSTARTUP=$HOME/Dropbox/gw_phd/code/pylib/startup.py
#s export IPYTHONDIR=$HOME/.ipython/
#s export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/:$HOME/data/myPrograms/atsas/lib/atsas/:$LD_LIBRARY_PATH

# added for GSL and boost
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# added for CUDA
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# added for VMD
export LD_LIBRARY_PATH=/home/schowell/data/myPrograms/vm:$LD_LIBRARY_PATH

# added for OpenACC Toolkit
export PATH=/opt/pgi/linux86-64/16.7/bin:$PATH

# added for theano
export CUDA_ROOT=/usr/local/cuda

# added for Launcher (https://github.com/tacc/launcher)
#export LAUNCHER_JOB_FILE=<file_to_run>
export LAUNCHER_WORKDIR=$HOME/data/myPrograms/launcher/

# added for zeppelin
export ZEPPELIN_HOME=$HOME/data/myPrograms/zeppelin
export PATH=$PATH:$ZEPPELIN_HOME/bin
export ZEPPELIN_PORT=9995

# added for spark
export SPARK_HOME=$HOME/data/myPrograms/spark
export PATH=$PATH:$SPARK_HOME/bin

# added for scala
export SCALA_HOME=$HOME/data/myPrograms/scala
export PATH=$PATH:$SCALA_HOME/bin

if [ -f ~/.profile ]; then
    . ~/.profile
fi
