# ~/.bashrc: executed by bash(1) for non-login shells.

## 加载别名定义和自定义函数
## load alias and function definition
for file in $HOME/.shell/bash_*
do
    . $file
done

## 设置语言环境
## set up language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## 启用高级tab补全
## Enable advanced tab completion
if [ -f /etc/bash_completion ]; then 
    . /etc/bash_completion 
fi

## 随机语录
## fortune cookie
if [ -x `which fortune` ];then
    case $- in
	*i* )  # We're interactive
	echo
	fortune fortunes fortunes2 linuxcookie
	echo
	;;
    esac
fi

## 设置ctex环境变量 
## setup ctet environment
if [ -f $HOME/context/tex/setuptex ]; then 
    . $HOME/context/tex/setuptex >/dev/null 2>&1
fi

## 定义颜色序列
## Define color sequence
# Below are the color init strings for the basic file types. A color init
# string consists of one or more of the following numeric codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
c_clr="\[\e[0m\]"	# 清除(clear)
c_blk="\[\e[01;30m\]"	# 黑色(black)
c_red="\[\e[01;31m\]"	# 红色(red)
c_grn="\[\e[01;32m\]"	# 绿色(green)
c_yel="\[\e[01;33m\]"	# 黄色(yellow)
c_blu="\[\e[01;34m\]"	# 蓝色(blue)
c_mgt="\[\e[01;35m\]"	# 紫红(magenta) 
c_cyn="\[\e[01;36m\]"	# 青蓝色(cyan)
c_wht="\[\e[01;37m\]"	# 白色(white)

## 不同TERM设定不同的变量
## setup different variables accord with different terminal
case "$TERM" in
    screen)
    ;;
    xterm)
    ;;
    *)
    ;;
esac

## 不同登入方式设置不同变量
## setup according to login method(ie. local remote or X)
case "`who am i | sed -n 's/.*(\(.*\))/\1/p'`" in
    *0:0) # do something for X display 0
    ;; 
    "") # local login
    ;;
    [0-9][0-9]*) # remote login
    ;;
    *) # others
    ;;
esac

export PS1="$c_grn\u@\h$c_blu \W \$ $c_clr"
## 编辑查看相关
## editor and pager
export EDITOR=vim
export VISUAL=vim
export PAGER=less

## 历史命令相关
## HISTORY tweak
export HISTCONTROL=ignoredups
export HISTIGNORE='&:bg:fg:ls:h'
export PROMPT_COMMAND="history -a"

## 路径
## path
PATH=${PATH/\.:}
export PATH=~/bin:$PATH:/usr/sbin/:/sbin/
export MANPATH=/usr/local/man:/usr/man:/usr/lib/java/man:/usr/local/share/man:$HOME/man
#export MANPATH=$MANPATH:/usr/local/share/man:$HOME/man

## man文档彩色输出
## colorful man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## Ctrl-d不会退出shell
## prevent ctrl-d from quiting shell
set -o ignoreeof
## tty1自动运行startx，并重设shell level
## auto execute startx on tty1 and reset shell level
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
    SHLVL=1
    startx
fi
