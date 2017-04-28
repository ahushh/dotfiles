# optimus
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
xrandr --output LVDS-1-0 --brightness 0.5
xrandr --dpi 96
# optimus end
#xrandr --output LVDS1 --brightness 0.5

# general
xmodmap .Xmodmap&
synclient TapButton1=1 &
synclient TapButton2=3 &
synclient TapButton3=2 &
syndaemon -i 1 -d &
setxkbmap -layout us,ru -option "compose:lwin,ctrl:nocaps,grp:rctrl_toggle,grp_led:scroll,nbsp:level3,misc:typo,lv3:menu_switch" -variant ",winkeys,biblical" &
xsetroot -cursor_name left_ptr &

# lxde
trayer --edge top --align right --height 10 --transparent true --width 3 --tint 0x000000 &
emacs&
#psi-plus &
urxvt &
firefox &
yeahconsole&

exec startlxde

# xmonad
#feh --bg-scale ~/snow.jpg &
#trayer --edge top --align right --height 10 --transparent true --width 3 --tint 0x000000 &
#yeahconsole&
#urxvt &
#firefox &
#yandex-disk start &
#/home/ahushh/i2p/i2prouter start&
#exec xmonad
