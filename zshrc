# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export EDITOR="vim"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export _JAVA_AWT_WM_NONREPARENTING=1
export LANG=en_US.UTF-8
export LOCALE=UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

DEFAULT_USER="leigh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github composer pip python ssh-agent svn yum)

export PULSE_SERVER=172.16.1.13


source $ZSH/oh-my-zsh.sh
#source $HOME/.aliases

export TERM=rxvt-unicode-256color

export PATH=~/.bin:~/.npm/coffee-script/1.4.0/package/bin:~/.bin:~/.gem/ruby/2.0.0/bin:/usr/local/bin:/opt/komodo/bin:/opt/java/bin:/var/www/ppdmlib/vendor/bin:/opt/node/node-v0.8.9-linux-x64/bin:/opt/node/node-v0.8.9-linux-x64/bin/node_modules/coffee-script/bin/:/opt/komodo/bin:/opt/java/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib64/qt4/bin:/usr/local/bin:/usr/lib64/qt4/bin:/home/leigh/.gem/ruby/2.0.0/bin/:$PATH

