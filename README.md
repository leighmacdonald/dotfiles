dotfiles
============================

My dotfiles repo built around zsh / awesome and zenburn. The shell and most shell (ncurses) apps are themed using
the standard zenburn zenburn colouring scheme as defined in Xdefaults.

Default Relevant Software I Use
-----------------------------------

- Window Manager: [AwesomeWM](http://awesome.naquadah.org/)
- Shell: [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
- Document Viewer: [zathura](http://pwmt.org/projects/zathura/)
- Browser: [Chromium](http://www.chromium.org/Home)
- Text Editor: [vim](http://www.vim.org/)
- IDE: [PyCharm](http://www.jetbrains.com/pycharm/) / [PHPStorm](http://www.jetbrains.com/phpstorm/)

Integrations
------------------------------------------

There are several integrations and plugins to help with the following tools / libs:

- [zsh](http://www.zsh.org/)
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) (git submodule) (plugins: git github composer pip python ssh-agent svn yum)
- [awesome-themes](https://github.com/mikar/awesome-themes) (git submodule)
- [Python](http://python.org)
- [virtualenv](https://github.com/pypa/virtualenv)
- [git](https://github.com/git/git)


Installation
-----------------------------

Tou must initialize the git submodules first

    $ git pull
    $ git submodule init
    $ git submodule update

There is a seperate python based tool called [dotupdate](https://github.com/leighmacdonald/dotupdate) to update
your symlinks in your home directory, its recommended to use this tool for this process. Please referrer to its
[README](https://github.com/leighmacdonald/dotupdate/blob/master/README.md) for installation procedures.


Setup Customization
----------------------------

To customize to your liking there are several options that should be configured to your particular setup.

1. Setup zsh and its plugins that will be used. You should disable any that you dont use as they are
   not cheap to startup and can be slow on standard HDD's.

    vim ~/.zshrc

2. If you wish to use a different $PS1 theme check out the zsh
   [themes](https://github.com/robbyrussell/oh-my-zsh/wiki/themes) available. Update your ~/.zshrc with the
    theme name of your choice to use it.

3. Configure awesome to use the theme of your choice. The list of available themes can be found at
   ~/.config/awesome/themes. These are pulled from [awesome-themes](https://github.com/mikar/awesome-themes).
   To select a theme just update line 12 in ~/.config/awesome/rc.lua to point to the correct theme file.

