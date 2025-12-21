{
    config,
    nixgl,
    pkgs,
    lib,
    ...
}:

{
    targets = {
        genericLinux = {
            enable = true;
            gpu = {
                enable = true;
                nvidia = {
                    enable = true;
                    version = "590.48.01";
                    sha256 = "sha256-ueL4BpN4FDHMh/TNKRCeEz3Oy1ClDWto1LO/LWlr1ok=";
                };
            };
        };
    };

    stylix = {
        enable = true;
        polarity = "dark";
        # -base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        fonts = {
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
            };
            serif = {
                package = pkgs.nerd-fonts.jetbrains-mono;
            };
            sansSerif = {
                package = pkgs.nerd-fonts.jetbrains-mono;
            };
            emoji = {
                package = pkgs.nerd-fonts.jetbrains-mono;
            };
        };
    };

    nixpkgs.config.nvidia.acceptLicense = true;

    nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (pkgs.lib.getName pkg) [
            "nvidia"
            "nvidia-x11"
        ];
    home = {
        username = "leigh";
        homeDirectory = "/home/leigh";

        # This value determines the Home Manager release that your configuration is
        # compatible with. This helps avoid breakage when a new Home Manager release
        # introduces backwards incompatible changes.
        #
        # You should not change this value, even if you update Home Manager. If you do
        # want to update the value, then make sure to first check the Home Manager
        # release notes.
        stateVersion = "25.11"; # Please read the comment before changing.

        packages = [
            pkgs.nixfmt
            pkgs.statix
            pkgs.sqlc
            pkgs.babelfish
            pkgs.gci
            pkgs.gofumpt
            pkgs.gopls
            pkgs.goreleaser
            pkgs.govulncheck
            pkgs.nilaway
            pkgs.oapi-codegen
            pkgs.templ
            pkgs.vhs
            #pkgs.nixgl.auto.nixGLDefault
            #pkgs.nerd-fonts-jetbrains-mono
            # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

        ];

        file = {
            # # Building this configuration will create a copy of 'dotfiles/screenrc' in
            # # the Nix store. Activating the configuration will then make '~/.screenrc' a
            # # symlink to the Nix store copy.
            # ".screenrc".source = dotfiles/screenrc;

            # # You can also set the file content immediately.
            # ".gradle/gradle.properties".text = ''
            #   org.gradle.console=verbose
            #   org.gradle.daemon.idletimeout=3600000
            # '';
        };

        #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
        sessionVariables = {
            EDITOR = "nvim";
        };
        sessionPath = [
            "$HOME/.nix-profile/bin"
            "/nix/var/nix/profiles/default/bin"
        ];
    };

    programs = {
        fish = {
            enable = true;
            interactiveShellInit = ''
                set fish_greeting # Disable greeting
                starship init fish | source
            '';
        };

        git = {
            enable = true;
            settings.user.name = "Leigh MacDonald";
            settings.user.email = "leigh.macdonald@gmail.com";
            ignores = [
                "*~"
                "*.swp"
                ".DS_Store"
            ];
        };
        gh = {
            enable = true;
        };
        lazygit.enable = true;
        lazydocker.enable = true;
        lazysql.enable = true;
        bun = {
            enable = true;
        };
        cava = {
            enable = true;
            settings = {
                general.framerate = 60;
            };
        };
        eza = {
            enable = true;
            colors = "auto";
            enableFishIntegration = true;
            git = true;
            icons = "auto";
            theme = ''
                colourful: true

                filekinds:
                  normal: {foreground: "#BAC2DE"}
                  directory: {foreground: "#89B4FA"}
                  symlink: {foreground: "#89DCEB"}
                  pipe: {foreground: "#7F849C"}
                  block_device: {foreground: "#EBA0AC"}
                  char_device: {foreground: "#EBA0AC"}
                  socket: {foreground: "#585B70"}
                  special: {foreground: "#CBA6F7"}
                  executable: {foreground: "#A6E3A1"}
                  mount_point: {foreground: "#74C7EC"}

                perms:
                  user_read: {foreground: "#CDD6F4"}
                  user_write: {foreground: "#F9E2AF"}
                  user_execute_file: {foreground: "#A6E3A1"}
                  user_execute_other: {foreground: "#A6E3A1"}
                  group_read: {foreground: "#BAC2DE"}
                  group_write: {foreground: "#F9E2AF"}
                  group_execute: {foreground: "#A6E3A1"}
                  other_read: {foreground: "#A6ADC8"}
                  other_write: {foreground: "#F9E2AF"}
                  other_execute: {foreground: "#A6E3A1"}
                  special_user_file: {foreground: "#CBA6F7"}
                  special_other: {foreground: "#585B70"}
                  attribute: {foreground: "#A6ADC8"}

                size:
                  major: {foreground: "#A6ADC8"}
                  minor: {foreground: "#89DCEB"}
                  number_byte: {foreground: "#CDD6F4"}
                  number_kilo: {foreground: "#BAC2DE"}
                  number_mega: {foreground: "#89B4FA"}
                  number_giga: {foreground: "#CBA6F7"}
                  number_huge: {foreground: "#CBA6F7"}
                  unit_byte: {foreground: "#A6ADC8"}
                  unit_kilo: {foreground: "#89B4FA"}
                  unit_mega: {foreground: "#CBA6F7"}
                  unit_giga: {foreground: "#CBA6F7"}
                  unit_huge: {foreground: "#74C7EC"}

                users:
                  user_you: {foreground: "#CDD6F4"}
                  user_root: {foreground: "#F38BA8"}
                  user_other: {foreground: "#CBA6F7"}
                  group_yours: {foreground: "#BAC2DE"}
                  group_other: {foreground: "#7F849C"}
                  group_root: {foreground: "#F38BA8"}

                links:
                  normal: {foreground: "#89DCEB"}
                  multi_link_file: {foreground: "#74C7EC"}

                git:
                  new: {foreground: "#A6E3A1"}
                  modified: {foreground: "#F9E2AF"}
                  deleted: {foreground: "#F38BA8"}
                  renamed: {foreground: "#94E2D5"}
                  typechange: {foreground: "#F5C2E7"}
                  ignored: {foreground: "#7F849C"}
                  conflicted: {foreground: "#EBA0AC"}

                git_repo:
                  branch_main: {foreground: "#CDD6F4"}
                  branch_other: {foreground: "#CBA6F7"}
                  git_clean: {foreground: "#A6E3A1"}
                  git_dirty: {foreground: "#F38BA8"}

                security_context:
                  colon: {foreground: "#7F849C"}
                  user: {foreground: "#BAC2DE"}
                  role: {foreground: "#CBA6F7"}
                  typ: {foreground: "#585B70"}
                  range: {foreground: "#CBA6F7"}

                file_type:
                  image: {foreground: "#F9E2AF"}
                  video: {foreground: "#F38BA8"}
                  music: {foreground: "#A6E3A1"}
                  lossless: {foreground: "#94E2D5"}
                  crypto: {foreground: "#585B70"}
                  document: {foreground: "#CDD6F4"}
                  compressed: {foreground: "#F5C2E7"}
                  temp: {foreground: "#EBA0AC"}
                  compiled: {foreground: "#74C7EC"}
                  build: {foreground: "#585B70"}
                  source: {foreground: "#89B4FA"}

                punctuation: {foreground: "#7F849C"}
                date: {foreground: "#F9E2AF"}
                inode: {foreground: "#A6ADC8"}
                blocks: {foreground: "#9399B2"}
                header: {foreground: "#CDD6F4"}
                octal: {foreground: "#94E2D5"}
                flags: {foreground: "#CBA6F7"}

                symlink_path: {foreground: "#89DCEB"}
                control_char: {foreground: "#74C7EC"}
                broken_symlink: {foreground: "#F38BA8"}
                broken_path_overlay: {foreground: "#585B70"}
            '';
        };
        btop = {
            enable = true;
            settings = {
                # color_theme = "catppuccin_mocha";
                heme_background = true;
                truecolor = true;
                rounded_corners = false;
                update_ms = 1000;
                custom_gpu_name0 = "RTX 4090";
            };

            themes = {
                catppuccin_mocha = ''
                    # Main background, empty for terminal default, need to be empty if you want transparent background
                    theme[main_bg]="#1E1E2E"

                    # Main text color
                    theme[main_fg]="#CDD6F4"

                    # Title color for boxes
                    theme[title]="#CDD6F4"

                    # Highlight color for keyboard shortcuts
                    theme[hi_fg]="#89B4FA"

                    # Background color of selected item in processes box
                    theme[selected_bg]="#45475A"

                    # Foreground color of selected item in processes box
                    theme[selected_fg]="#89B4FA"

                    # Color of inactive/disabled text
                    theme[inactive_fg]="#7F849C"

                    # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
                    theme[graph_text]="#F5E0DC"

                    # Background color of the percentage meters
                    theme[meter_bg]="#45475A"

                    # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
                    theme[proc_misc]="#F5E0DC"

                    # CPU, Memory, Network, Proc box outline colors
                    theme[cpu_box]="#cba6f7" #Mauve
                    theme[mem_box]="#a6e3a1" #Green
                    theme[net_box]="#eba0ac" #Maroon
                    theme[proc_box]="#89b4fa" #Blue

                    # Box divider line and small boxes line color
                    theme[div_line]="#6C7086"

                    # Temperature graph color (Green -> Yellow -> Red)
                    theme[temp_start]="#a6e3a1"
                    theme[temp_mid]="#f9e2af"
                    theme[temp_end]="#f38ba8"

                    # CPU graph colors (Teal -> Lavender)
                    theme[cpu_start]="#94e2d5"
                    theme[cpu_mid]="#74c7ec"
                    theme[cpu_end]="#b4befe"

                    # Mem/Disk free meter (Mauve -> Lavender -> Blue)
                    theme[free_start]="#cba6f7"
                    theme[free_mid]="#b4befe"
                    theme[free_end]="#89b4fa"

                    # Mem/Disk cached meter (Sapphire -> Lavender)
                    theme[cached_start]="#74c7ec"
                    theme[cached_mid]="#89b4fa"
                    theme[cached_end]="#b4befe"

                    # Mem/Disk available meter (Peach -> Red)
                    theme[available_start]="#fab387"
                    theme[available_mid]="#eba0ac"
                    theme[available_end]="#f38ba8"

                    # Mem/Disk used meter (Green -> Sky)
                    theme[used_start]="#a6e3a1"
                    theme[used_mid]="#94e2d5"
                    theme[used_end]="#89dceb"

                    # Download graph colors (Peach -> Red)
                    theme[download_start]="#fab387"
                    theme[download_mid]="#eba0ac"
                    theme[download_end]="#f38ba8"

                    # Upload graph colors (Green -> Sky)
                    theme[upload_start]="#a6e3a1"
                    theme[upload_mid]="#94e2d5"
                    theme[upload_end]="#89dceb"

                    # Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
                    theme[process_start]="#74C7EC"
                    theme[process_mid]="#89DCEB"
                    theme[process_end]="#cba6f7"
                '';
            };
        };

        ghostty = {
            enable = true;
            enableFishIntegration = true;
            package = config.lib.nixGL.wrap pkgs.ghostty;
            settings = {
                font-size = 16;
                font-family = "JetBrainsMono Nerd Font";
                theme = "Catppuccin Mocha";
                window-theme = "dark";
                window-decoration = false;
                window-padding-x = 10;
                window-padding-y = 10;
                confirm-close-surface = false;
                initial-window = false;
                shell-integration-features = "cursor,sudo,title,ssh-env,ssh-terminfo,path";
                linux-cgroup = "always";
                linux-cgroup-hard-fail = true;
                clipboard-read = "allow";
                clipboard-write = "allow";
                adjust-cell-width = "-7%";
                font-thicken = true;
                #clipboard-trim-trailing-spaces = true
                working-directory = "home";
                background-opacity = 1;
                background-blur = true;
            };
            themes = {
                catppuccin-mocha = {
                    background = "1e1e2e";
                    cursor-color = "f5e0dc";
                    foreground = "cdd6f4";
                    palette = [
                        "0=#45475a"
                        "1=#f38ba8"
                        "2=#a6e3a1"
                        "3=#f9e2af"
                        "4=#89b4fa"
                        "5=#f5c2e7"
                        "6=#94e2d5"
                        "7=#bac2de"
                        "8=#585b70"
                        "9=#f38ba8"
                        "10=#a6e3a1"
                        "11=#f9e2af"
                        "12=#89b4fa"
                        "13=#f5c2e7"
                        "14=#94e2d5"
                        "15=#a6adc8"
                    ];
                    selection-background = "353749";
                    selection-foreground = "cdd6f4";
                };
            };
        };

        starship = {
            # "$schema" = "https://starship.rs/config-schema.json";
            enable = true;
            settings = lib.mkMerge [
                (builtins.fromTOML (
                    builtins.readFile "${pkgs.starship}/share/starship/presets/catppuccin-powerline.toml"
                ))
                {
                    # here goes my custom configurations
                    palette = lib.mkForce "catppuccin_mocha";
                    add_newline = false;
                    direnv = {
                        disabled = false;
                    };
                    os.disabled = lib.mkDefault true;
                    status = {
                        style = "";
                        symbol = "[⨯](fg:red bg:lavender)";
                        success_symbol = "[✓](fg:black bg:lavender)";
                        format = "[$symbol$common_meaning$signal_name$maybe_int]($style)";
                        map_symbol = true;
                        disabled = false;
                    };
                    git_metrics = {
                        disabled = false;
                        ignore_submodules = true;
                    };
                    format = lib.mkForce (
                        lib.concatStrings [
                            "[](red)"
                            "$os"
                            "$username"
                            "[](bg:peach fg:red)"
                            "$directory"
                            "[](bg:yellow fg:peach)"
                            "$git_branch"
                            "$git_status"
                            "[](fg:yellow bg:green)"
                            "$c$rust$golang$nodejs$php$haskell$python"
                            "[](fg:sapphire bg:lavender)"
                            "$status"
                            "$time"
                            "[ ](fg:lavender)"
                            "$cmd_duration"
                            "$line_break"
                            "$character"
                        ]

                    );

                }
            ];
        };
        zoxide.enable = true;
        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
        fzf.enable = true;
        jq.enable = true;

        home-manager.enable = true;
        nix-index.enable = true;
        nix-index-database.comma.enable = true;
        rofi = {
            enable = true;
            #            font = "JetBrainsMono Nerd Font 18";
            modes = [ "drun" ];
            #theme =
            #    let
            #        inherit (config.lib.formats.rasi) mkLiteral;
            #    in
            #    {
                    "*" = {
                        rosewater = mkLiteral "#f5e0dc";
                        flamingo = mkLiteral "#f2cdcd";
                        pink = mkLiteral "#f5c2e7";
                        mauve = mkLiteral "#cba6f7";
                        red = mkLiteral "#f38ba8";
                        maroon = mkLiteral "#eba0ac";
                        peach = mkLiteral "#fab387";
                        yellow = mkLiteral "#f9e2af";
                        green = mkLiteral "#a6e3a1";
                        teal = mkLiteral "#94e2d5";
                        sky = mkLiteral "#89dceb";
                        sapphire = mkLiteral "#74c7ec";
                        blue = mkLiteral "#89b4fa";
                        lavender = mkLiteral "#b4befe";
                        text = mkLiteral "#cdd6f4";
                        subtext1 = mkLiteral "#bac2de";
                        subtext0 = mkLiteral "#a6adc8";
                        overlay2 = mkLiteral "#9399b2";
                        overlay1 = mkLiteral "#7f849c";
                        overlay0 = mkLiteral "#6c7086";
                        surface2 = mkLiteral "#585b70";
                        surface1 = mkLiteral "#45475a";
                        surface0 = mkLiteral "#313244";
                        base = mkLiteral "#1e1e2e";
                        mantle = mkLiteral "#181825";
                        crust = mkLiteral "#11111b";
                        selected-active-foreground = mkLiteral "@background";
                        lightfg = mkLiteral "@text";
                        separatorcolor = mkLiteral "@foreground";
                        urgent-foreground = mkLiteral "@red";
                        alternate-urgent-background = mkLiteral "@lightbg";
                        lightbg = mkLiteral "@mantle";
                        background-color = mkLiteral "transparent";
                        border-color = mkLiteral "@foreground";
                        normal-background = mkLiteral "@background";
                        selected-urgent-background = mkLiteral "@red";
                        alternate-active-background = mkLiteral "@lightbg";
                        spacing = mkLiteral "2";
                        alternate-normal-foreground = mkLiteral "@foreground";
                        urgent-background = mkLiteral "@background";
                        selected-normal-foreground = mkLiteral "@lightbg";
                        active-foreground = mkLiteral "@blue";
                        background = mkLiteral "@base";
                        selected-active-background = mkLiteral "@blue";
                        active-background = mkLiteral "@background";
                        selected-normal-background = mkLiteral "@lightfg";
                        alternate-normal-background = mkLiteral "@lightbg";
                        foreground = mkLiteral "@text";
                        selected-urgent-foreground = mkLiteral "@background";
                        normal-foreground = mkLiteral "@foreground";
                        alternate-urgent-foreground = mkLiteral "@red";
                        alternate-active-foreground = mkLiteral "@blue";
                    };

                    element = {
                        padding = mkLiteral "1px";
                        cursor = mkLiteral "pointer";
                        spacing = mkLiteral "5px";
                        border = 0;
                    };
                    "element normal.normal" = {
                        background-color = mkLiteral "@normal-background";
                        text-color = mkLiteral "@normal-foreground";
                    };
                    "element normal.urgent" = {
                        background-color = mkLiteral "@urgent-background";
                        text-color = mkLiteral "@urgent-foreground";
                    };
                    "element normal.active" = {
                        background-color = mkLiteral "@active-background";
                        text-color = mkLiteral "@active-foreground";
                    };
                    "element selected.normal" = {
                        background-color = mkLiteral "@selected-normal-background";
                        text-color = mkLiteral "@selected-normal-foreground";
                    };
                    "element selected.urgent" = {
                        background-color = mkLiteral "@selected-urgent-background";
                        text-color = mkLiteral "@selected-urgent-foreground";
                    };
                    "element selected.active" = {
                        background-color = mkLiteral "@selected-active-background";
                        text-color = mkLiteral "@selected-active-foreground";
                    };
                    "element alternate.normal" = {
                        background-color = mkLiteral "@alternate-normal-background";
                        text-color = mkLiteral "@alternate-normal-foreground";
                    };
                    "element alternate.urgent" = {
                        background-color = mkLiteral "@alternate-urgent-background";
                        text-color = mkLiteral "@alternate-urgent-foreground";
                    };
                    "element alternate.active" = {
                        background-color = mkLiteral "@alternate-active-background";
                        text-color = mkLiteral "@alternate-active-foreground";
                    };
                    "element-text" = {
                        background-color = mkLiteral "transparent";
                        cursor = mkLiteral "inherit";
                        highlight = mkLiteral "inherit";
                        text-color = mkLiteral "inherit";
                    };
                    "element-icon" = {
                        background-color = mkLiteral "transparent";
                        size = mkLiteral "1.0000em";
                        cursor = mkLiteral "inherit";
                        text-color = mkLiteral "inherit";
                    };
                    window = {
                        padding = 5;
                        background-color = mkLiteral "@background";
                        border = 1;
                    };
                    mainbox = {
                        padding = 0;
                        border = 0;
                    };
                    message = {
                        padding = mkLiteral "1px";
                        border-color = mkLiteral "@separatorcolor";
                        border = mkLiteral "2px dash 0px 0px";
                    };
                    textbox = {
                        text-color = mkLiteral "@foreground";
                    };
                    listview = {
                        padding = mkLiteral "2px 0px 0px";
                        scrollbar = true;
                        border-color = mkLiteral "@separatorcolor";
                        spacing = mkLiteral "2px";
                        fixed-height = 0;
                        border = mkLiteral "2px dash 0px 0px";
                    };
                    scrollbar = {
                        width = mkLiteral "4px";
                        padding = 0;
                        handle-width = mkLiteral "8px";
                        border = 0;
                        handle-color = mkLiteral "@normal-foreground";
                    };
                    sidebar = {
                        border-color = mkLiteral "@separatorcolor";
                        border = mkLiteral "2px dash 0px 0px";
                    };
                    button = {
                        cursor = mkLiteral "pointer";
                        spacing = 0;
                        text-color = mkLiteral "@normal-foreground";
                    };
                    "button selected" = {
                        background-color = mkLiteral "@selected-normal-background";
                        text-color = mkLiteral "@selected-normal-foreground";
                    };
                    "num-filtered-rows" = {
                        expand = false;
                        text-color = mkLiteral "Gray";
                    };
                    "num-rows" = {
                        expand = false;
                        text-color = mkLiteral "Gray";
                    };
                    "textbox-num-sep" = {
                        expand = false;
                        str = "/";
                        text-color = mkLiteral "Gray";
                    };
                    "#inputbar" = {
                        padding = mkLiteral "1px";
                        spacing = mkLiteral "0px";
                        text-color = mkLiteral "@normal-foreground";
                        children = map mkLiteral [
                            "prompt"
                            "textbox-prompt-colon"
                            "entry"
                            "num-filtered-rows"
                            "textbox-num-sep"
                            "num-rows"
                            "case-indicator"
                        ];
                    };
                    "case-indicator" = {
                        spacing = 0;
                        text-color = mkLiteral "@normal-foreground";
                    };
                    "entry" = {
                        text-color = mkLiteral "@normal-foreground";
                        cursor = mkLiteral "text";
                        spacing = 0;
                        placeholder-color = mkLiteral "Gray";
                        placeholder = "Type to filter";
                    };
                    "prompt" = {
                        spacing = 0;
                        text-color = mkLiteral "@normal-foreground";
                    };
                    "textbox-prompt-colon" = {
                        margin = mkLiteral "0px 0.3000em 0.0000em 0.0000em";
                        expand = false;
                        str = ":";
                        text-color = mkLiteral "inherit";
                    };
                };
        };
        uv.enable = true;
        sqls.enable = true;

        zathura = {
            enable = true;
            options = {
                recolor = true;
            };
        };
        zellij = {
            enable = true;
            settings = {
                theme = "catppuccin-mocha";
            };
        };
        waybar = {
            enable = true;
            systemd.enable = true;
            settings = {
                mainBar = {
                    output = "DP-3";
                    #  "layer" = "Optional", // Waybar at top layer
                    position = "bottom";
                    height = 32; # Waybar height (to be removed for auto height)
                    #width = 1280; # Waybar width
                    "spacing" = 2; # Gaps between modules (4px)
                    # Choose the order of the modules
                    "modules-left" = [ "mpd" ];
                    "modules-center" = [ ];
                    "modules-right" = [
                        "systemd-failed-units"
                        "custom/weather"
                        "cpu"
                        "memory"
                        "disk#root"
                        "disk#storage"
                        "disk#music"
                        "temperature#cpu"
                        "custom/gpu-usage"
                        "pulseaudio"
                        "clock"
                        "tray"
                    ];
                    "systemd-failed-units" = {
                        "hide-on-ok" = false; # // Do not hide if there is zero failed units.
                        "format" = "<span color=\"#f38ba8\">✗ {nr_failed}</span>";
                        "format-ok" = "<span color=\"#a6e3a1\">✓</span>";
                        "system" = true; # // Monitor failed systemwide units.
                        "user" = true; # // Ignore failed user units.
                    };
                    "custom/weather" = {
                        "format" = "{}°";
                        "tooltip" = true;
                        "interval" = 3600;
                        "exec" = "wttrbar --hide-conditions --nerd";
                        "return-type" = "json";
                    };
                    "disk#root" = {
                        "interval" = 30;
                        "format" = " {percentage_free}%";
                        "path" = "/";
                    };
                    "disk#storage" = {
                        "interval" = 30;
                        "format" = "󰒍 {percentage_free}%";
                        "path" = "/mnt/storage";
                    };
                    "disk#music" = {
                        "interval" = 30;
                        "format" = " {percentage_free}%";
                        "path" = "/mnt/storage/music";
                    };
                    "hyprland/workspaces" = {
                        "persistent-workspaces" = {
                            "1" = [ "HDMI-A-1" ];
                            "2" = [ "DP-2" ];
                            "3" = [ "DP-1" ];
                            "4" = [ "DP-3" ];
                        };
                    };
                    "gamemode" = {
                        "format" = "{glyph}";
                        "format-alt" = "{glyph} {count}";
                        "glyph" = "";
                        "hide-not-running" = true;
                        "use-icon" = true;
                        "icon-name" = "input-gaming-symbolic";
                        "icon-spacing" = 4;
                        "icon-size" = 16;
                        "tooltip" = true;
                        "tooltip-format" = "Games running: {count}";
                    };
                    "mpd" = {
                        "format" =
                            "<span color=\"#b4befe\">{artist}</span> <span color=\"#89b4fa\">{album}</span> <span color=\"#89dceb\">{title}</span> <span color=\"#eba0ac\">{elapsedTime:%M:%S}</span>/<span color=\"#f38ba8\">{totalTime:%M:%S}</span>";
                        "format-disconnected" = "Disconnected";
                        "format-stopped" = "Stopped";
                        "unknown-tag" = "N/A";
                        "interval" = 2;
                        "on-click" = "ghostty -e rmpc";
                        "max-length" = 100;
                        "consume-icons" = {
                            "on" = " ";
                        };
                        "random-icons" = {
                            "off" = "<span color=\"#f53c3c\"></span> ";
                            "on" = " ";
                        };
                        "repeat-icons" = {
                            "on" = " ";
                        };
                        "single-icons" = {
                            "on" = "1 ";
                        };
                        "state-icons" = {
                            "paused" = "<span color=\"#1e66f5\">></span>";
                            "playing" = "<span color=\"#40a02b\"></span>";
                        };
                        "tooltip-format" = "MPD (connected)";
                        "tooltip-format-disconnected" = "MPD (disconnected)";
                    };
                    "idle_inhibitor" = {
                        "format" = "{icon}";
                        "format-icons" = {
                            "activated" = "";
                            "deactivated" = "";
                        };
                    };
                    "tray" = {
                        "icon-size" = 24;
                        "spacing" = 6;
                    };
                    "clock" = {
                        "timezone" = "America/Edmonton";
                        "format" = "󰃭 {:%Y-%m-%d <span color=\"#f9e2af\">󰥔 %H:%M</span>}";
                        "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
                        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
                        "calendar" = {
                            "mode" = "year";
                            "mode-mon-col" = 3;
                            "weeks-pos" = "right";
                            "on-scroll" = 1;
                            "format" = {
                                "months" = "<span color='#f9e2af'><b>{}</b></span>";
                                "days" = "<span color='#74c7ec'><b>{}</b></span>";
                                "weeks" = "<span color='#cba6f7'><b>W{}</b></span>";
                                "weekdays" = "<span color='#f5c2e7'><b>{}</b></span>";
                                "today" = "<span color='#a6e3a1'><b><u>{}</u></b></span>";
                            };
                        };
                        "actions" = {
                            "on-click-right" = "mode";
                            "on-scroll-up" = "tz_up";
                            "on-scroll-down" = "tz_down";
                        };
                    };
                    "cpu" = {
                        "interval" = 1;
                        "format" =
                            " <span color='#94e2d5'>{load}/{usage}%</span> {icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
                        "format-icons" = [
                            "<span color='#74c7ec'>▁</span>"
                            "<span color='#89dceb'>▂</span>"
                            "<span color='#94e2d5'>▃</span>"
                            "<span color='#a6e3a1'>▄</span>"
                            "<span color='#f9e2af'>▅</span>"
                            "<span color='#fab387'>▆</span>"
                            "<span color='#eba0ac'>▇</span>"
                            "<span color='#f38ba8'>█</span>"
                        ];
                    };
                    "memory" = {
                        "states" = {
                            "good" = 10;
                            "warning" = 80;
                            "critical" = 95;
                        };
                        "format" = " {percentage}%";
                    };
                    "temperature#cpu" = {
                        # "thermal-zone": 2;
                        "hwmon-path" = "/sys/class/hwmon/hwmon6/temp1_input";
                        "critical-threshold" = 80;
                        "format-critical" = "{icon} {temperatureC}°C";
                        "format" = "{icon} {temperatureC}°C";
                        "format-icons" = [
                            ""
                            ""
                            ""
                        ];
                    };
                    "custom/gpu-usage" = {
                        # "exec"= "nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total --format=csv,noheader,nounits";
                        "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
                        "format" = "󰈐 {}%";
                        "return-type" = "";
                        "interval" = 1;
                    };
                    "load" = {
                        "interval" = 1;
                        "format" = "load: {load1} {load5} {load15}";
                    };
                    "network" = {
                        "interface" = "tailscale0"; # // (Optional) To force the use of this interface
                        "format-wifi" = "{essid} ({signalStrength}%) ";
                        "format-ethernet" = "{ipaddr}/{cidr} ";
                        "tooltip-format" = "{ifname} via {gwaddr} ";
                        "format-linked" = "{ifname} (No IP) ";
                        "format-disconnected" = "Disconnected ⚠";
                        "format-alt" = "{ifname}: {ipaddr}/{cidr}";
                    };
                    "user" = {
                        "format" = "up {work_d} days ↑";
                        "icon" = false;
                    };
                    "pulseaudio" = {
                        "format" = "{icon} {volume}%";
                        "format-bluetooth" = "{volume}% {icon} {format_source}";
                        "format-bluetooth-muted" = "󰝟 {icon} {format_source}";
                        "format-muted" = "󰝟 {format_source}";
                        "format-source" = "{volume}%";
                        "format-source-muted" = "";
                        "format-icons" = {
                            "headphone" = "";
                            "hands-free" = "";
                            "headset" = "";
                            "phone" = "";
                            "portable" = "";
                            "car" = "";
                            "default" = [
                                ""
                                ""
                                ""
                            ];
                        };
                        "on-click" = "pavucontrol";
                    };
                };
            };
            style = ''
                @define-color flamingo #f2cdcd;
                @define-color pink #f5c2e7;
                @define-color mauve #cba6f7;
                @define-color red #f38ba8;
                @define-color maroon #eba0ac;
                @define-color peach #fab387;
                @define-color yellow #f9e2af;
                @define-color green #a6e3a1;
                @define-color teal #94e2d5;
                @define-color sky #89dceb;
                @define-color sapphire #74c7ec;
                @define-color blue #89b4fa;
                @define-color lavender #b4befe;
                @define-color text #cdd6f4;
                @define-color subtext1 #bac2de;
                @define-color subtext0 #a6adc8;
                @define-color overlay2 #9399b2;
                @define-color overlay1 #7f849c;
                @define-color overlay0 #6c7086;
                @define-color surface2 #585b70;
                @define-color surface1 #45475a;
                @define-color surface0 #313244;
                @define-color base #1e1e2e;
                @define-color mantle #181825;
                @define-color crust #11111b;

                * {
                  font-family: JetBrainsMono Nerd Font;
                  font-size: 16px;
                  min-height: 0;
                }

                #waybar {
                  /*background: transparent;*/
                  background-color: @mantle;
                  color: @sapphire;
                  border-bottom: 1px solid @sapphire;
                }

                #workspaces {
                  border-radius: 1rem;
                  margin: 5px;
                  margin-left: 1rem;
                }

                #workspaces button {
                  color: @lavender;
                  border-radius: 1rem;
                  padding: 0.4rem;
                }

                #workspaces button.active {
                  color: @sky;
                  border-radius: 1rem;
                }

                #workspaces button:hover {
                  color: @sapphire;
                  border-radius: 1rem;
                }

                #custom-music,
                #tray,
                #backlight,
                #clock,
                #battery,
                #mpd,
                #load,
                #network,
                #temperature,
                #memory,
                #cpu,
                #gamemode,
                #disk,
                #pulseaudio,
                #systemd-failed-units,
                #custom-lock,
                #custom-power {
                  background-color: @mantle;
                  padding: 2px 8px;
                  margin: 0;
                }

                #systemd-failed-units {
                  border-bottom: 1px solid @pink;
                }

                #custom-gpu-usage {
                  color: @green;
                  border-bottom: 1px solid @green;
                }

                #mpd {
                  border-bottom: 1px solid @mauve;
                }

                #custom-weather {
                  color: @yellow;
                  border-bottom: 1px solid @yellow;
                }

                #temperature.cpu,
                #temperature.gpu {
                  color: @red;
                  border-bottom: 1px solid @red;
                }

                #disk {
                  color: @teal;
                  border-bottom: 1px solid @teal;
                }
                #cpu {
                  color: @maroon;
                  border-bottom: 1px solid @maroon;
                }
                #memory.good {
                  color: @green;
                  border-bottom: 1px solid @green;
                }

                #memory.warning {
                  color: @peach;
                  border-bottom: 1px solid @peach;
                }

                #memory.critical {
                  color: @red;
                  border-bottom: 1px solid @red;
                }

                #clock {
                  color: @pink;
                  border-bottom: 1px solid @pink;
                }

                #pulseaudio {
                  color: @mauve;
                  border-bottom: 1px solid @mauve;
                }

                #custom-lock {
                  border-radius: 1rem 0px 0px 1rem;
                }

                #tray {
                  /**margin-right: 1rem;
                  border-radius: 1rem;*/
                  border-bottom: 1px solid @sapphire;
                }
            '';
        };
        rmpc = {
            enable = true;
            config = ''
                #![enable(implicit_some)]
                #![enable(unwrap_newtypes)]
                #![enable(unwrap_variant_newtypes)]
                (
                    address: "127.0.0.1:6600",
                    password: None,
                    theme: Some("cat"),
                    cache_dir: "~/.cache/rmpc",
                    lyrics_dir: "/mnt/storage/music",
                    on_song_change: ["~/.config/rmpc/notify", "~/.config/rmpc/increment_play_count"],
                    volume_step: 5,
                    max_fps: 30,
                    scrolloff: 0,
                    wrap_navigation: false,
                    enable_mouse: true,
                    enable_config_hot_reload: true,
                    status_update_interval_ms: 1000,
                    rewind_to_start_sec: None,
                    keep_state_on_song_change: true,
                    reflect_changes_to_playlist: false,
                    select_current_song_on_change: false,
                    ignore_leading_the: false,
                    browser_song_sort: [Disc, Track, Artist, Title],
                    directories_sort: SortFormat(group_by_type: true, reverse: false),
                    album_art: (
                        method: Auto,
                        max_size_px: (width: 1200, height: 1200),
                        disabled_protocols: ["http://", "https://"],
                        vertical_align: Center,
                        horizontal_align: Center,
                    ),
                    keybinds: (
                        global: {
                            ":":       CommandMode,
                            ",":       VolumeDown,
                            "s":       Stop,
                            ".":       VolumeUp,
                            "<Tab>":   NextTab,
                            "<S-Tab>": PreviousTab,
                            "1":       SwitchToTab("Queue"),
                            "2":       SwitchToTab("Directories"),
                            "3":       SwitchToTab("Artists"),
                            "4":       SwitchToTab("Album Artists"),
                            "5":       SwitchToTab("Albums"),
                            "6":       SwitchToTab("Playlists"),
                            "7":       SwitchToTab("Search"),
                            "q":       Quit,
                            ">":       NextTrack,
                            "p":       TogglePause,
                            "<":       PreviousTrack,
                            "f":       SeekForward,
                            "z":       ToggleRepeat,
                            "x":       ToggleRandom,
                            "c":       ToggleConsume,
                            "v":       ToggleSingle,
                            "b":       SeekBack,
                            "~":       ShowHelp,
                            "u":       Update,
                            "U":       Rescan,
                            "I":       ShowCurrentSongInfo,
                            "O":       ShowOutputs,
                            "P":       ShowDecoders,
                            "R":       AddRandom,
                        },
                        navigation: {
                            "k":         Up,
                            "j":         Down,
                            "h":         Left,
                            "l":         Right,
                            "<Up>":      Up,
                            "<Down>":    Down,
                            "<Left>":    Left,
                            "<Right>":   Right,
                            "<C-k>":     PaneUp,
                            "<C-j>":     PaneDown,
                            "<C-h>":     PaneLeft,
                            "<C-l>":     PaneRight,
                            "<C-u>":     UpHalf,
                            "N":         PreviousResult,
                            "a":         Add,
                            "A":         AddAll,
                            "r":         Rename,
                //            "<C-R>": Rating(kind: Value(5)),
                            "n":         NextResult,
                            "g":         Top,
                            "<Space>":   Select,
                            "<C-Space>": InvertSelection,
                            "G":         Bottom,
                            "<CR>":      Confirm,
                            "i":         FocusInput,
                            "J":         MoveDown,
                            "<C-d>":     DownHalf,
                            "/":         EnterSearch,
                            "<C-c>":     Close,
                            "<Esc>":     Close,
                            "K":         MoveUp,
                            "D":         Delete,
                            "B":         ShowInfo,
                            "<C-z>":     ContextMenu(),
                            "<C-s>":     Save(kind: Modal(all: false, duplicates_strategy: Ask)),
                        },
                        queue: {
                            "D":       DeleteAll,
                            "<CR>":    Play,
                            "a":       AddToPlaylist,
                            "d":       Delete,
                            "C":       JumpToCurrent,
                            "X":       Shuffle,
                        },
                    ),
                    search: (
                        case_sensitive: false,
                        ignore_diacritics: false,
                        search_button: false,
                        mode: Contains,
                        tags: [
                            (value: "any",         label: "Any Tag"),
                            (value: "artist",      label: "Artist"),
                            (value: "album",       label: "Album"),
                            (value: "albumartist", label: "Album Artist"),
                            (value: "title",       label: "Title"),
                            (value: "filename",    label: "Filename"),
                            (value: "genre",       label: "Genre"),
                        ],
                    ),
                    artists: (
                        album_display_mode: SplitByDate,
                        album_sort_by: Date,
                        album_date_tags: [Date],
                    ),
                    tabs: [
                        (name: "Home", pane: Split(direction: Horizontal, panes: [
                                    (size: "70%", borders: "NONE", pane: Split(direction: Vertical,panes: [
                                                (size: "3", borders: "ALL", pane: Component("custom_song_table_header")),
                                                (size: "100%", borders: "ALL", pane: Pane(Queue)),
                                            ])
                                    ),
                                    (size: "30%", borders: "NONE", pane: Split(direction: Vertical, panes: [
                                                (size: "0.45r", borders: "ALL", pane: Pane(AlbumArt)),
                                                (size: "100%", borders: "NONE", pane: Pane(Lyrics)),
                                            ])
                                    ),
                                ])
                        ),
                        (name: "Directories", pane: Split(direction: Horizontal,panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Directories)),
                                ])
                        ),
                        (name: "Playlists", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Playlists)),
                                ])
                        ),
                        (name: "Artists", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Artists)),
                                ])
                        ),
                        (name: "Albums", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Albums)),
                                ])
                        ),
                        (name: "Album Artists", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(AlbumArtists)),
                                ])
                        ),
                        (name: "Genre", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Browser(root_tag: "genre", separator: ";"))),
                                ])
                        ),
                        (name: "Queue", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Queue))
                                ])
                        ),
                        (name: "Show",pane: Split(direction: Vertical, panes: [
                                    (size: "50%", pane: Split(direction: Horizontal, panes: [
                                                (size: "22%", borders: "ALL", pane: Pane(Queue)),
                                                (size: "56%", borders: "ALL", pane: Pane(Lyrics)),
                                                (size: "22%", borders: "ALL", pane: Pane(AlbumArt)),
                                            ])
                                    ),
                                    (size: "50%", borders: "ALL", pane: Pane(Cava)),
                                ])
                        ),
                        (name: "Search", pane: Split(direction: Horizontal, panes: [
                                    (size: "100%", borders: "ALL", pane: Pane(Search)),
                                ])
                        ),
                    ],
                    cava: (
                        framerate: 60, // default 60
                        autosens: true, // default true
                        sensitivity: 100, // default 100
                        lower_cutoff_freq: 50, // not passed to cava if not provided
                        higher_cutoff_freq: 10000, // not passed to cava if not provided
                        input: (
                            method: Fifo,
                            source: "/tmp/mpd.fifo",
                            sample_rate: 44100,
                            channels: 2,
                            sample_bits: 16,
                        ),
                        smoothing: (
                            noise_reduction: 77, // default 77
                            monstercat: false, // default false
                            waves: false, // default false
                        ),
                        // this is a list of floating point numbers thats directly passed to cava
                        // they are passed in order that they are defined
                        eq: []
                    ),
                )
            '';
        };

    };
    nix = {
        package = pkgs.nix;
        settings = {
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
        gc = {
            automatic = true;
            options = "--delete-older-than 30d";
        };
    };

    services = {
        mpd = {
            enable = true;
            network.startWhenNeeded = false;
            musicDirectory = "/mnt/storage/music";
            playlistDirectory = "/mnt/storage/music/_playlists";
            dbFile = "~/.config/mpd/database";
            extraConfig = ''
                sticker_file                    "~/.config/mpd/sticker.sql"
                save_absolute_paths_in_playlists        "yes"
                auto_update     "yes"
                auto_update_depth "3"
                follow_outside_symlinks "no"
                follow_inside_symlinks          "yes"
                audio_output {
                    type            "pipewire"
                    name            "PipeWire Sound Server"
                }
                audio_output {
                    type            "fifo"
                    name            "Visualizer feed"
                    path            "/tmp/mpd.fifo"
                    format          "44100:16:2"
                }
                replaygain                      "auto"
                filesystem_charset              "UTF-8"
            '';
        };
        dunst = {
            enable = true;
            #            settings = {
            #    global = {
            #        frame_color = "#89b4fa";
            #        separator_color = "frame";
            #        highlight = "#89b4fa";
            #    };
            #    urgency_low = {
            #        background = "#1e1e2e";
            #        foreground = "#cdd6f4";
            #    };
            #
            #    urgency_normal = {
            #        background = "#1e1e2e";
            #        foreground = "#cdd6f4";
            #    };
            #
            #    urgency_critical = {
            #        background = "#1e1e2e";
            #                 foreground = "#cdd6f4";
            #       frame_color = "#fab387";
            #   };
        };
    };
}
