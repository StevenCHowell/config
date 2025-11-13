# added for dot-file repo: config
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# nvidia
alias htop-cuda='watch -n 1 nvidia-smi'

# arlis
[ -d ~/data/arlis/artiamas/catkin-docker/ ] && export PATH=~/data/arlis/artiamas/catkin-docker:$PATH

# aws profile
alias aws_d="export AWS_PROFILE=default"
alias aws_u="export AWS_PROFILE=usg"

# pytest
alias pytest='pytest --disable-warnings'

alias update="sudo pkcon refresh ; sudo pkcon update"
alias update_clean="sudo pkcon refresh ; sudo pkcon -y update ; sudo apt -y autoremove --purge ; sudo apt -y autoclean"

# try one of these if pkcon doesn't work well on Ubuntu
# option 1, generic
# if [ -e /etc/lsb-release ]; then
#     . /etc/lsb-release
#     if [ ${DISTRIB_ID} = Ubuntu ]; then
#         alias update="sudo apt update ; sudo apt -y -m upgrade"
#         alias update_clean="sudo apt update ; sudo apt -y -m dist-upgrade ; sudo apt -y autoremove ; sudo apt -y autoclean"
#     elif [ ${DISTRIB_ID} = neon ]; then
#         alias update="sudo pkcon refresh ; sudo pkcon update"
#         alias update_clean="sudo pkcon refresh ; sudo pkcon -y update ; sudo apt -y autoremove --purge ; sudo apt -y autoclean"
#     fi
# fi
#  option 2, specific
# if [[ ( `hostname -s` = red5 ) ]]; then
#     alias update="sudo pkcon refresh ; sudo pkcon update"
#     alias update_clean="sudo pkcon refresh ; sudo pkcon -y update ; sudo apt -y autoremove --purge ; sudo apt -y autoclean"
# else
#     alias update="sudo apt update ; sudo apt -y -m upgrade"
#     alias update_clean="sudo apt update ; sudo apt -y -m dist-upgrade ; sudo apt -y autoremove ; sudo apt -y autoclean"
# fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='emacs'
else
  export EDITOR='code'
fi
export VISUAL="code"
export LESS="-R"

umask 027
set notify
set history=500

## resume wget downloads
alias wget='wget -c'

# multi eog for specified extension: `eogn *.png`
eogn () { for i; do eog -n "$i" & done; }

alias l='ls -1rt --color=tty'
alias l.="ls -lhtrdF .* --color=tty"
alias sl="ls -FX --color=tty"
alias ls="ls -FX --color=tty"
alias ll="ls -ltrhF --color=tty"
alias la="ls -a -trhF --color=tty"
alias lla="ls -a -ltrhF --color=tty"
alias lss="ls -lShr --color=tty"
alias lsh="ls -lt --color=tty | head"
alias lst="ls -lrt --color=tty | tail"
alias lsa="ls -lrta --color=tty | tail"
alias lsd='ls -lt | grep drwx | head'
alias dir='dir --color=tty'
alias rm="rm -ir --preserve-root"
alias mv="mv -iv"
alias cp="cp -iva"

alias trash="for f in $@; do mv $f ~/trashcan; done"

alias df="df -h"
alias du="du -sh * | sort -h"
alias du1='du -d 1'
alias disks='sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'

alias md="mkdir -pv"
alias rd="rmdir"
alias cls="clear"
alias mv="mv -iv"
alias cp="cp -iva"

alias lmake="make&&make"  # only run second `make` if first one suceeds
alias svn_id='svn propset svn:keywords "Id"'

# alias sed='sed -E'   # set sed to modify files in place
alias dir="lt"
# alias lock="gnome-screensaver-command -l"

alias topme="htop -u schowell"

# clamav
alias fullscan="sudo clamscan -ir --exclude-dir=^/sys --exclude-dir=^/dev --exclude-dir=^/proc /"

alias grep='grep --color=auto -n'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
# alias now='date +"%T"'
alias now='date +"%H:%M:%S"'
alias nowtime=now
alias nowdate='date +"%Y%m%d"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias ping='time ping'

# show open ports
alias ports='netstat -tulanp'

# # Parenting changing perms on /
# alias chown='chown --preserve-root'
# alias chmod='chmod --preserve-root'
# alias chgrp='chgrp --preserve-root'

# NVIDIA top
alias nvidia-top='watch -n0.5 nvidia-smi'

## pass options to free
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'


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
alias targz="\tar cvfz --use-compress-program=pigz"
alias tarbz="\tar cvfj"
alias untargz="\tar xvfz"
alias untarbz="\tar xvfj"

# alias cvsslapper='cvs -d /u24/local/cvsroot/programs'
# alias cvspap='cvs -d /u24/local/cvsroot/papers '
alias xfig='xfig -bg white -centimeters -pwidth 25.8 -pheight 19.7'
alias xdvi='xdvi -bg white -s 10'

# Set global environment variables
CVS_RSH="ssh"; export CVS_RSH
export CVSEDITOR="emacs -nw --no-init-file"

# # added for GSL and boost
# [ -d /usr/local/lib ] && export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
#
# # added for VMD
# [ -d /home/schowell/data/myPrograms/vm ] && export LD_LIBRARY_PATH=/home/schowell/data/myPrograms/vm:$LD_LIBRARY_PATH
#
# # added for OpenACC Toolkit
# [ -d /opt/pgi/linux86-64/16.7/bin ] && export PATH=/opt/pgi/linux86-64/16.7/bin:$PATH
#
# # add to path
# [ -d ~/.local/bin/ ] && export PATH=~/.local/bin/:$PATH
# [ -d ~/bin/ ] && export PATH=~/bin/:$PATH
# [ -d ~/data/myPrograms/bin/ ] && export PATH=~/data/myPrograms/bin/:$PATH
# [ -d "/usr/local/cuda/bin" ] && export PATH="/usr/local/cuda/bin:$PATH"
# [ -d /snap/bin/ ] && export PATH=/snap/bin/:$PATH
#
# added for CUDA
[ -d /usr/local/cuda/lib64 ] && export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
[ -d /usr/local/cuda/bin ] && export PATH=/usr/local/cuda/bin:$PATH
[ -d /usr/lib ] && export GLPATH=/usr/lib

# added for theano
[ -d /usr/local/cuda ] && export CUDA_ROOT=/usr/local/cuda

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# de-duplicate pushd
# https://unix.stackexchange.com/a/288532/83205
dedup(){
    declare -a new=() copy=("${DIRSTACK[@]:1}")
    declare -A seen
    local v i
    seen[$PWD]=1
    for v in "${copy[@]}"
    do if [ -z "${seen[$v]}" ]
       then new+=("$v")
            seen[$v]=1
       fi
    done
    dirs -c
    for ((i=${#new[@]}-1; i>=0; i--))
    do      builtin pushd -n "${new[i]}" >/dev/null
    done
}

# automatically activate and deactivate Python virtual environments
function cd {
    builtin cd "$@"
    if [ -d "venv" ]; then
        source venv/bin/activate
    elif [ -d ".venv" ]; then
        source .venv/bin/activate
    fi
}
# for another option, see https://stackoverflow.com/a/50830617/3585557

# pushd(){
#     builtin pushd "$@"
#     dedup
# }

# alias crysol="crysol -lm 50 -fb 18" #xray default
# alias crysol="crysol -lm 15 -fb 18" #my default (lm is important for MASSHA but takes much longer)
# alias crysol="crysol -lm 10 -fb 18 -sm 0.2" #my default (lm = Q_max * D_max / pi, and it is not accurate beyond 0.2)

# # added for Launcher (https://github.com/tacc/launcher)
# #export LAUNCHER_JOB_FILE=<file_to_run>
# export LAUNCHER_WORKDIR=$HOME/data/myPrograms/launcher/


# # Compile & Debug C
# # alias val="valgrind --leak-check=full -v --show-reachable=yes"
# alias val="valgrind --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
# alias valv="valgrind --verbose --tool=memcheck --leak-check=full -v --show-reachable=yes --track-origins=yes"
# alias gcc='gcc -ansi -std=c99 -pedantic -Wall -g'

# # for OSPRay imcompatibility bug in VMD
# if [[ ( `hostname -s` = thor ) ]]; then
#     export VMDNOOSPRAY=1
# fi
