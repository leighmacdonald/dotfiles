dotfiles
============================

My dotfiles repo built around zsh / awesome and zenburn. The shell and most shell (ncurses) apps are themed using
the standard zenburn colouring scheme as defined in Xdefaults. The awesome configu

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

Currently the UI fonts are mostly centered around the faily new Source Code Pro by adobe. These are easy
to install using yaourt if you are using Arch Linux, its in the AUR.

    $ yaourt -S ttf-source-code-pro

If you are not running Arch you can still [download](http://sourceforge.net/projects/sourcesans.adobe/files/) the
files and install them manually.

Multiple Computer Setup
----------------------------

Since we are using git to perform all the filesyncing magic is quite easy to have custom configurations all based on
one master config. For example i have some hosts in ssh/config that are only accessable under certain conditions (LAN).
I want to update these for only some systems, to do that we create a branch. Personally i used a different branch for
each system im using.

1. The first step is creating your branch

    $ git checkout -b your_branch

2. Edit a file

    $ vim ssh/config

3. Commit it

    $ git commit -a -m "Updated ssh config"

4. Push your branch

    $ git push origin devel

5. Pull changes in from master

    $ git merge master

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

4. Wallpaper settings are configured using the wallpaper_file variable under config/awesome/rc.lua:39. By default its set
   to load the file located at ~/.wallpaper.png if the file exists. Please note that this will override any background
   set by one of the awesome-themes configurations.

Important Awesome Keybindings
----------------------------------

Here are some of the most useful keybindings confiured in awesome. To get the full list you
should look at the awesome/rc.lua file directory.

- **mod4** Windows key ususally
- **mod4 + Enter** Spawn terminal
- **mod4 + r** Run and focus command prompt
- **mod4 + h** Move window divider up/left
- **mod4 + l** Move window divider down/right
- **mod4 + j** Move focus counter-clockwise
- **mod4 + k** Move focus clockwise
- **mod4 + c** Close the currently focused window
- **mod4 + f** (un)fullscreen the active window
- **mod4 + shift + t** Show/Hide the application title bar
- **mod4 + shift + f** Enable/Disable floating windows
