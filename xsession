
#!/bin/sh

userresources=$HOME/.Xresources

usermodmap=$HOME/.Xmodmap

sysresources=/etc/X11/xinit/.Xresources

sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f  $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then

    xmodmap $sysmodmap

fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then

    xmodmap "$usermodmap"

fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then

    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do

        [ -x "$f" ] && . "$f"

    done

    unset f

fi

# Composer
picom &
# Wallpaper
feh --bg-scale Wallpaper/wallpaperarch.png
#Monitor
#<PageUp>
#<PageDown>
xrandr --output DVI-D-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --off --output DP-1 --off

