export PS1='\h:\w\$ '
umask 022

export HISTCONTROL=ignoredups

PATH=/root/local/sbin:/root/sbin:/opt/chj/bin/:/opt/chj/vserveradmin/server/:/opt/vserver/sbin:/usr/local/sbin:/usr/local/bin:/usr/local/Gambit-C/current/bin:/usr/sbin:/usr/bin:/sbin:/bin

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."
alias uuuuu="cd ../../../../.."
alias les=less
alias le=zless
alias c=cd
alias lt="l|tail -20"
export EDITOR=e

cdnewdir() {
    if [ "$#" -eq 1 ]; then
        mkdir "$1" && cd "$1"
    else
        echo One argument required
    fi
};
mvcdnewdir() {
    if [ "$#" -gt 1 ]; then
        mvnewdir "$@" && cd "${!#}"   # ${!#}: Tip 16Nov02 1544 von #bash
    else
        echo At least two arguments expected
    fi
};
mvcd() {
    if [ "$#" -gt 1 ]; then
        if [ -d "${!#}" ]; then
            mv "$@" && cd "${!#}"
        else
            #echo Last argument is not a directory
            if [ "$#" -eq 2 ]; then
                if [ -d "$1" ]; then
                    mv "$@" && cd "${!#}"
                else
                    echo Neither argument is a directory
                fi
            else
                echo More than two arguments and last one is not a directory
            fi
        fi
    else
        echo At least two arguments expected
    fi
}
cd_newest_sisterfolder() {
    cd "`find .. -type d -maxdepth 1 -print0 |grep -zZ -v '^\.*$'|xargs -0 -s 129023 -n 129023 --exit --no-run-if-empty ls -dt|head -1`"
}
cd_newest() {
    cd "`find . -type d -maxdepth 1 -print0|grep -zZ -v '^\.*$'|xargs -0 -s 129023 -n 129023 --exit --no-run-if-empty ls -dt|head -1`"
}
cdt () 
{ 
    if checkcreate-tmp-owner-dir; then
        cd "/tmp/$USER";
    fi
}
cdpwd() {
    cd "`pwd -P`"
}
cdp() {
    cd "`pwd -P`"
}
export COLUMNS
HISTSIZE=1500

unlimit() {
    ulimit -S -v unlimited
}

alias find=my.find
alias df=my.df

alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

tar () {
    echo "'tar': use tar-names or tar-numbers instead" >&2
    return 1
}

export LANG=de_CH.UTF8
