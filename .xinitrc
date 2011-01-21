#!/bin/sh

## 保存startx日志
## logging startx
! [ -d ~/tmp ] && mkdir ~/tmp
[ -f ~/tmp/startx.log ] && mv -f ~/tmp/startx.log ~/tmp/startx.log.bak
exec > ~/tmp/startx.log 2>&1
set -v

## 读入用户自定义常见X配置文件
## load normal X startup config files
[ -f ~/.xmodmap ] && xmodmap ~/.xmodmap
[ -f ~/.xrdb ] && xrdb -load ~/.xrdb

## X 属性
## X properties
# 关闭X下的beep声
# enjoy nobeep in X
xset b off
# 设置dpi
# setup dpi
xrandr --dpi 122

## 窗口管理器
## window manager
#wm=startkde
#wm=startxfce4
wm=dwm

## 输入法环境变量
## input method
#export GTK_IM_MODULE=xim
#export XMODIFIERS="@im=fcitx"
#export XIM=fcitx
#export XIM_PROGRAM=fcitx

#export GTK_IM_MODULE=xim
#export XMODIFIERS="@im=scim"
#export XIM=scim
#export XIM_PROGRAM=scim

## 预加载程序(preload apps)
# 输入法(input method)
fcitx -d
#scim -d &
# 打开数字键盘灯(toggle numlock)
#xsetnumlock &
# 使边缘变黑先(make edge black)
xsetroot -bg black &
# 加载壁纸(load wallpaper)
eval `cat ~/.fehbg`

## 启动窗口管理器(start wm)
if [ "$wm" -ne "dwm" ]; then
    exec $wm
fi

## dwm自启动程序
## autostart apps for dwm
#xterm -e screen -D -R &
urxvt -e screen -D -R &
#urxvtd -q -f -o
#urxvtc -e screen -D -R &
opera &

## dwm会话
## dwm session

#while true; do 
#    xsetroot -name "$( date +"%F %R" )"
#    sleep 1m
#done &
conky | while read -r; do xsetroot -name "$REPLY"; done &
#$HOME/bin/dwm_status_bar.pl | while read -r; do xsetroot -name "$REPLY"; done &

### for dwm 4.8 or earlier
#DWM_FIFO=~/.dwm.fifo
#DWM_SCRIPTS=~/bin/dwm-status.sh
#[ -e "$DWM_FIFO" ] || mkfifo "$DWM_FIFO"
#[ -p "$DWM_FIFO" ] && $DWM_SCRIPTS > $DWM_FIFO &
#dwm <"$DWM_FIFO"

exec dwm
