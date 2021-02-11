# added for dot-file repo: config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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

# alias source_beet="source ~/Music/venv/bin/activate"

# alias crysol="crysol -lm 50 -fb 18" #xray default
# alias crysol="crysol -lm 15 -fb 18" #my default (lm is important for MASSHA but takes much longer)
# alias crysol="crysol -lm 10 -fb 18 -sm 0.2" #my default (lm = Q_max * D_max / pi, and it is not accurate beyond 0.2)
# alias foxs="foxs -q 0.2 -s 200"
# alias scatter="java -jar $HOME/data/myPrograms/scatter3a_jar/scatter3.jar &"
# alias amd="sudo amdcccle"
alias lmake="make&&make"
alias du="du -sh * | sort -h"
alias svn_id='svn propset svn:keywords "Id"'
alias disks='sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'

# From Joseph
alias lsd='ls -lt | grep drwx | head'
# alias cdsm='cd ~/data/myPrograms/sasmol/'
# alias cds2='cd ~/data/codesassie_svn/sassie_2.0/'

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
# alias lock="gnome-screensaver-command -l"

alias xemacs="xemacs21"
alias topme="htop -u schowell"

# clamav
alias fullscan="sudo clamscan -ir --exclude-dir=^/sys --exclude-dir=^/dev --exclude-dir=^/proc /"

alias grep='grep --color=auto -n'
alias cls="clear"
alias mv="mv -iv"
alias cp="cp -iva"
alias df='df -k'

# # Print Commands
# alias lpr="lpr -Plj4250"
# alias lprc="\lpr -PXerox8560DN"
# alias lprc2="\lpr -PLexmarkC534dn"
# alias lprbw="\lpr -PLaserjet9000"
# alias lpq="lpq -Plj4250"
# alias lpqc="lpq -PPhaser8200"

# # Compile & Debug C
# # alias val="valgrind --leak-check=full -v --show-reachable=yes"
# alias val="valgrind --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
# alias valv="valgrind --verbose --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
# alias gcc='gcc -ansi -std=c99 -pedantic -Wall -g'

alias rsync='rsync -e ssh -rltDuv -O --modify-window=1 --progress --no-group --ignore-errors'
# alias rsync='rsync -e ssh -auv --progress --ignore-errors -utvl'
alias mpage='mpage -H -4 -bLetter -f -c'
alias ps2pdf='ps2pdf -dOptimize=true -dEPSCrop -dAutoRotatePages=/None -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dUseFlateCompression=true'
alias mountiso='mount -o loop -t iso9660 -r'

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

# alias cvsslapper='cvs -d /u24/local/cvsroot/programs'
# alias cvspap='cvs -d /u24/local/cvsroot/papers '
alias xfig='xfig -bg white -centimeters -pwidth 25.8 -pheight 19.7'
alias xdvi='xdvi -bg white -s 10'

# export MATLAB_JAVA=/usr/lib/jvm/java-6-openjdk/jre;
# alias tmatlab='matlab -nodesktop -nosplash'
# alias gmatlab='matlab -nosplash -desktop &'
# alias oldtmatlab='$HOME/data/myPrograms/matlab2010b/bin/matlab -nodesktop -nosplash'
# alias oldgmatlab='$HOME/data/myPrograms/matlab2010b/bin/matlab -nosplash -desktop &'
# # For 32-bit matlab on 64-bit OS ##
# alias tmatlab='matlab -glnx86 -nosplash -nodesktop'
# alias gmatlab='matlab -glnx86 -nosplash -desktop &'


# alias xmatlab='\matlab &'
# alias sedfit='wine /home/programs/wine/drive_c/sedfit/sedfit.exe'
# alias JabRef='java -jar /home/programs/download/JabRef-2.3.1.jar'
# alias cabaretstage='/home/programs/cabaretstage/cabaretstage.sh'

# # linux programs
# alias raw='python $HOME/data/myPrograms/bioxtasraw/src/RAW.py &'
# alias mathematica='$HOME/data/myPrograms/Mathematica9/bin/Mathematica'
# alias zotero='$HOME/data/myPrograms/Zotero_linux-x86_64/zotero'
# alias cb='java -jar $HOME/data/myPrograms/ColorOracle.jar'

# Set global environment variables
CVS_RSH="ssh"; export CVS_RSH
#export CVSROOT=$HOME/data/cvsRepo
export CVSEDITOR="emacs -nw --no-init-file"
export TEXINPUTS=.:$HOME/paper/texpkg//::
export BSTINPUTS=.:$HOME/paper/texpkg//:
export BIBINPUTS=.:$HOME/paper/bib//:

export XENVIRONMENT=$HOME/.Xdefaults
# export PATH="$HOME/data/myPrograms/bin:$HOME/data/myPrograms/atsas/bin:$HOME/data/myPrograms/NAMD:$HOME/bin:/usr/local/cuda/bin:$PATH"

#PATH=`echo $PATH | tr ':' '\n' | sort -bu | paste -s -d:` # this sorts removing duplicates but messes up the order

#xrdb -load $HOME/.Xdefaults

# added for GSL and boost
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# added for CUDA
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# # added for VMD
# export LD_LIBRARY_PATH=/home/schowell/data/myPrograms/vm:$LD_LIBRARY_PATH

# added for OpenACC Toolkit
export PATH=/opt/pgi/linux86-64/16.7/bin:$PATH

# added for theano
export CUDA_ROOT=/usr/local/cuda

# # added for Launcher (https://github.com/tacc/launcher)
# #export LAUNCHER_JOB_FILE=<file_to_run>
# export LAUNCHER_WORKDIR=$HOME/data/myPrograms/launcher/

# # added for zeppelin
# export ZEPPELIN_HOME=$HOME/data/myPrograms/zeppelin
# export PATH=$PATH:$ZEPPELIN_HOME/bin
# export ZEPPELIN_PORT=9995

# # added for spark
# export SPARK_HOME=$HOME/data/myPrograms/spark
# export PATH=$PATH:$SPARK_HOME/bin

# # added for scala
# export SCALA_HOME=$HOME/data/myPrograms/scala
# export PATH=$PATH:$SCALA_HOME/bin

if [ -f ~/.profile ]; then
    . ~/.profile
fi
