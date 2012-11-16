# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

export LANG=en_US.UTF-8
export LOCALE=UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="juanghurtado"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/.bin:~/.gem/ruby/1.9.1/bin:/usr/local/bin:/opt/komodo/bin:/opt/java/bin:/var/www/ppdmlib/vendor/bin:/opt/node/node-v0.8.9-linux-x64/bin:/opt/node/node-v0.8.9-linux-x64/bin/node_modules/coffee-script/bin/:/opt/komodo/bin:/opt/java/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lib64/qt4/bin:/usr/local/bin:/usr/lib64/qt4/bin

# Solaris fix
export TERM=xterm
