# ~/.bashrc: executed by bash(1) for non-login shells.

for file in $HOME/.bash/*
do
    source $file
done

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -f /etc/bash_completion ]; then 
. /etc/bash_completion 
fi

# fortune cookie
#if [ -x `which fortune` ];then
#    case $- in
#	*i* )  # We're interactive
#	echo
#	fortune fortunes fortunes2 linuxcookie
#	echo
#	;;
#    esac
#fi

if [ -f $HOME/context/tex/setuptex ]; then 
. $HOME/context/tex/setuptex >/dev/null 2>&1
fi
# using ssh without password

if [ $TERM == "screen" ]; then
    export PS1='\[\033[01;34m\]\W \[\033[00;39m\]☻ '
    #export PS1='\[\033k\033\\\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00;39m\] '
elif [ $TERM == "xterm" ]; then
    export PS1='\[\033[01;34m\]\W \[\033[00;39m\]☯ '
else
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00;39m\] '
fi
#▶
export EDITOR=vim
export VISUAL=vim
export PAGER=less
# history tweak
export HISTCONTROL=ignoredups
export HISTIGNORE='&:bg:fg:ls:h'
export PROMPT_COMMAND="history -a"
PATH=${PATH/\.:}
PATH=~/bin:$PATH:/usr/sbin/:/sbin/
MANPATH=$MANPATH:/usr/local/share/man:$HOME/man
export PATH MANPATH

# colorful man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  startx
#  logout
fi
