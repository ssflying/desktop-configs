#!/bin/sh

[ -f ~/.xmodmap ] && xmodmap ~/.xmodmap
# enjoy nobeep in X
xset b off
xrandr --dpi 122
### Enviroments
# input method
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS="@im=fcitx"
#export XIM_PROGRAM=fcitx
#export XIM=fcitx

#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
#export XMODIFIERS="@im=SCIM"
#export XIM_PROGRAM=scim
#export XIM=scim
#
### preload apps
fcitx -d
#scim -d &
#xsetnumlock & # set numlock on
xsetroot -bg black # make edge black.
eval `cat ~/.fehbg`

### start x sessions
#exec enlightenment_start
#exec startkde
#exec icewm-session
#exec startxfce4

#xterm -e screen -D -R &
urxvt -e screen -D -R &
#urxvtd -q -f -o
#urxvtc -e screen -D -R &

#exec fvwm
#exec fvwm-themes-start
#exec wmaker
#exec openbox-session

# dwm session
#while true; do 
#    xsetroot -name "$( date +"%F %R" )"
#    sleep 1m
#done &
conky | while read -r; do xsetroot -name "$REPLY"; done &
#/home/pfc/bin/dwm_status_bar.pl | while read -r; do xsetroot -name "$REPLY"; done &
### for dwm 4.8 or earlier
#DWM_FIFO=~/.dwm.fifo
#DWM_SCRIPTS=~/bin/dwm-status.sh
#[ -e "$DWM_FIFO" ] || mkfifo "$DWM_FIFO"
#[ -p "$DWM_FIFO" ] && $DWM_SCRIPTS > $DWM_FIFO &
#dwm <"$DWM_FIFO"

exec dwm

