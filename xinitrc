# Merge configs
xrdb -merge .Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#131313'

# Start a browser session
chromium &
xflux -z 98101 -r 1 -n
# Enable dual screens on ATI using xrandr
start-pulseaudio-x11
dualmode
synergys --debug ERROR
# Start window manager
#exec gnome-session
exec awesome
#exec gnome-session
#exec startfluxbox
