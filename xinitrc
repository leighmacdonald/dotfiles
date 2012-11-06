# Merge configs
xrdb -merge .Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#131313'

# Start a browser session
chromium &

# Tell JAVA we are using a non-reparenting window manager
wmname LG3D

# Enable dual screens on ATI using xrandr
dualmode

# Start window manager
exec awesome
