# Merge configs
xrdb -merge .Xresources

# Start a browser session
chromium &

# Enable dual screens on ATI using xrandr
dualmode

# Start window manager
exec awesome
#exec startfluxbox
