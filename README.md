# dotfiles

## Setup / Usage

    git clone --bare <git-repo-url> $HOME/.dotfiles
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
    dotfiles checkout
    dotfiles config --local status.showUntrackedFiles no

Then just use the `dotfiles` command instead of `git` for management while under
`~/`.

[Additional info](https://www.atlassian.com/git/tutorials/dotfiles)

## Whats Included

This is primarily a home-manager based system with some extra configs that are
not supported by it yet.

There is global theming provided by [stylix](https://nix-community.github.io/stylix/).

## Applying

You will need to install [home-manger](https://github.com/nix-community/home-manager)
somewhere.

Then to build & apply the config run:

    $ home-manager build --impure && home-manager switch --impure
    Starting Home Manager activation
    ...
    Activating checkExistingGpuDrivers
    Activating zedSettingsActivation

This configuration include [nixGL](https://github.com/nix-community/nixGL),
however my setup is using proprietary nvidia GPU drivers. If you do not use
those, you can remove the `--impure` arguments that make me sad.
You **must** adjust the CPU configuration to match your needs.

See [home.nix](https://github.com/leighmacdonald/dotfiles/blob/master/.config/home-manager/home.nix)
for the majority of the actual configuration.
