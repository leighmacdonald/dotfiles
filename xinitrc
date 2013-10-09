# Merge configs
xrdb -merge .Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#131313'

# Start a browser session
chromium &

# Enable dual screens on ATI using xrandr
dualmode
synergys	
# Start window manager
/home/leigh/.bin/vertical.sh
#exec gnome-session
exec awesome
#exec startfluxbox
