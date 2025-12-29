{
    config,
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

    accounts = {
        email = {
            accounts = {
                gmail = {
                    enable = true;
                    realName = "Leigh MacDonald";
                    address = "leigh.macdonald@gmail.com";
                    primary = true;
                };
            };
        };
    };

    stylix = {
        enable = true;
        autoEnable = true;
        polarity = "dark";
        # -base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
        imageScalingMode = "fill";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        overlays.enable = true;
        opacity.popups = 0.8;
        override = {
            base00 = "11111b";
        };
        fonts = {
            sizes = {
                applications = 16;
                terminal = 18;
                desktop = 22;
                popups = 26;

            };
            serif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Serif";
            };

            sansSerif = {
                package = pkgs.dejavu_fonts;
                name = "DejaVu Sans";
            };
            monospace = {
                package = pkgs.nerd-fonts.jetbrains-mono;
                name = "JetBrainsMono Nerd Font";
            };
            emoji = {
                package = pkgs.noto-fonts-color-emoji;
                name = "Noto Color Emoji";
            };
        };
        targets = {
            font-packages = {
                enable = true;
            };
            fontconfig.fonts = {
                enable = true;
            };
            ghostty = {
                enable = true;
                colors.enable = true;
                fonts.enable = true;
            };
            cava = {
                rainbow.enable = true;
            };
        };
    };

    #fonts = {
    #packages = with pkgs; [
    #    nerd-fonts.jetbrains-mono
    #    #nerd-fonts.droid-sans-mono
    #];
    #    fontconfig = {
    #        enable = true;
    #    };
    #};

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

        packages = with pkgs; [
            nixfmt
            statix
            sqlc
            babelfish
            gci
            gofumpt
            gopls
            goreleaser
            govulncheck
            nilaway
            oapi-codegen
            templ
            vhs
            sops
            age
            nil
            nixpkgs-fmt
            flameshot
            delta
            bat
            #(pkgs.glibcLocales.override {
            #    allLocales = false;
            #    locales = [ "en_US.UTF-8/UTF-8" ];
            #})
            #pkgs.nixgl.auto.nixGLDefault
            # pkgs.nerd-fonts.jetbrains-mono
            #(pkgs.nerd-fonts.override { fonts = [ "JetBrainsMono Nerd Font" ]; })

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
            SUDO_EDITOR = "nvim";
            MANPAGER = "nvim +Man!";
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
            settings = {
                gpg = {
                    format = "ssh";
                };
                commit = {
                    gpgsign = true;
                };
                rerere = {
                    enabled = true;
                };
                diff = {
                    algorithm = "histogram";
                    submodule = "log";
                };
                core = {
                    pager = "delta";
                    autocrlf = false;
                };
                fetch = {
                    prune = true;
                };
                init = {
                    defaultBranch = "master";
                };
                push = {
                    autoSetupRemote = true;
                    followtags = true;
                };
                rebase = {
                    updateRefs = true;
                };
                merge = {
                    conflictstyle = "zdiff3";
                };
                status = {
                    submoduleSummary = true;
                };
                submodule = {
                    recurse = true;
                };
                user = {
                    name = "Leigh MacDonald";
                    email = "leigh.macdonald@gmail.com";
                    signingkey = "~/.ssh/id_rsa.pub";
                };
            };
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

        gpg = {
            enable = true;
            mutableKeys = true;
            mutableTrust = true;
        };

        zed-editor = {
            enable = true;
            extensions = [
                "catppuccin"
                "catppuccin-icons"
                "dockerfile"
                "github-actions"
                "golangci-lint"
                "gosum"
                "gotmpl"
                "neocmake"
                "nix"
                "postgres-language-server"
                "postgres-context-server"
                "sql"
                "templ"
                "vhs"
            ];

            userSettings = {
                telemetry = {
                    diagnostics = false;
                    metrics = false;
                };
                tabs = {
                    show_diagnostics = "all";
                    git_status = true;
                    file_icons = true;
                };

                project_panel = {
                    hide_hidden = false;
                    hide_root = true;
                    auto_reveal_entries = false;
                    indent_size = 10.0;
                    file_icons = true;
                    entry_spacing = "standard";
                    hide_gitignore = false;
                };
                window_decorations = "server";
                use_system_window_tabs = false;
                bottom_dock_layout = "full";

                collaboration_panel = {
                    button = false;
                };
                close_on_file_delete = true;
                use_smartcase_search = true;
                when_closing_with_no_tabs = "keep_window_open";
                git = {
                    branch_picker = {
                        show_author_name = false;
                    };
                    blame = {
                        show_avatar = false;
                    };
                    inline_blame = {
                        enabled = false;
                    };
                };
                title_bar = {
                    show_sign_in = false;
                    show_user_picture = false;
                    show_menus = false;
                    show_branch_icon = true;
                };
                search = {
                    button = true;
                };
                status_bar = {
                    cursor_position_button = true;
                };
                inlay_hints = {
                    edit_debounce_ms = 695;
                };
                indent_guides = {
                    enabled = false;
                    background_coloring = "indent_aware";
                    coloring = "indent_aware";
                };
                soft_wrap = "prefer_line";
                preferred_line_length = 121;
                minimap = {
                    show = "never";
                };
                scrollbar = {
                    show = "always";
                };
                relative_line_numbers = "disabled";
                hover_popover_delay = 200;
                show_signature_help_after_edits = true;
                auto_signature_help = true;
                #icon_theme = "";
                unstable.ui_density = "compact";
                base_keymap = "JetBrains";
                lsp = {
                    hls = {
                        initialization_options = {
                            haskell = {
                                formattingProvider = "fourmolu";
                            };
                        };
                    };
                };
                context_servers = {
                    postgres-context-server = {
                        source = "extension";
                        enabled = true;
                        settings = {
                            database_url = "postgresql://gbans:gbans@localhost:5432/gbans";
                        };
                    };
                };
                languages = {
                    SQL = {
                        formatter = {
                            external = {
                                command = "sql-formatter";
                                arguments = [
                                    "--language"
                                    "postgresql"
                                ];
                            };
                        };
                    };
                };
            };
        };

        keepassxc = {
            enable = true;
            #autostart = true;
            settings = {
                General = {
                    AutoGeneratePasswordForNewEntries = true;
                    ConfigVersion = 2;
                    MinimizeAfterUnlock = true;
                };

                Browser = {
                    Enabled = true;
                };
                GUI = {
                    ApplicationTheme = "dark";
                    CompactMode = true;
                    MinimizeOnClose = true;
                    MinimizeToTray = true;
                    ShowTrayIcon = true;
                    TrayIconAppearance = "monochrome-light";
                };

                PasswordGenerator = {
                    Length = 20;
                };

                Security = {
                    ClearClipboard = false;
                    IconDownloadFallback = true;
                    LockDatabaseIdle = false;
                };

                FdoSecrets = {
                    Enabled = true;
                };
            };
        };

        eza = {
            enable = true;
            colors = "auto";
            enableFishIntegration = true;
            git = true;
            icons = "never";
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
        };

        ghostty = {
            enable = true;
            enableFishIntegration = true;
            package = config.lib.nixGL.wrap pkgs.ghostty;
            settings = {
                window-theme = "dark";
                window-decoration = false;
                window-padding-x = 5;
                window-padding-y = 5;
                confirm-close-surface = false;
                initial-window = false;
                shell-integration-features = "cursor,sudo,title,ssh-env,ssh-terminfo,path";
                linux-cgroup = "always";
                linux-cgroup-hard-fail = true;
                clipboard-read = "allow";
                clipboard-write = "allow";
                adjust-cell-width = "-7%";
                working-directory = "home";
                background-blur = true;
                #font-family = "\"JetBrainsMono Nerd Font\"";
            };
        };

        starship = {
            # "$schema" = "https://starshiprs/config-schema.json";
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
                        symbol = "[⨯](bold fg:red bg:lavender)";
                        success_symbol = "[✓](bold fg:black bg:lavender)";
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
                            "[](bold red)"
                            "$os"
                            "$username"
                            "[](bold bg:peach fg:red)"
                            "$directory"
                            "[](bold bg:yellow fg:peach)"
                            "$git_branch"
                            "$git_status"
                            "[](bold fg:yellow bg:green)"
                            "$c$rust$golang$nodejs$php$haskell$python"
                            "[](bold fg:sapphire bg:lavender)"
                            "$status"
                            "$time"
                            "[ ](bold fg:lavender)"
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
                    spacing = 2; # Gaps between modules (4px)
                    # Choose the order of the modules
                    modules-left = [ "mpd" ];
                    modules-center = [ "clock" ];
                    modules-right = [
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
                        #"max-length" = 100;
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
                    on_song_change: ["/home/leigh/.config/rmpc/notify.sh", "/home/leigh/.config/rmpc/increment_play_count"],
                    volume_step: 5,
                    max_fps: 120,
                    scrolloff: 0,
                    wrap_navigation: false,
                    enable_mouse: true,
                    enable_config_hot_reload: true,
                    enable_lyrics_hot_reload: true,
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
                            "1":       SwitchToTab("Home"),
                            "2":       SwitchToTab("Directories"),
                            "3":       SwitchToTab("Playlists"),
                            "4":       SwitchToTab("Artists"),
                            "5":       SwitchToTab("Albums"),
                            "6":       SwitchToTab("Album Artists"),
                            "7":       SwitchToTab("Genre"),
                            "8":       SwitchToTab("Queue"),
                            "9":       SwitchToTab("Show"),
                            "0":       SwitchToTab("Search"),
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
                            "<PageUp>":    PageUp,
                            "<PageDown>":  PageDown,
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
                        ignore_diacritics: true,
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
                                                (size: "3", borders: "NONE", pane: Component("custom_song_table_header")),
                                                (size: "100%", borders: "NONE", pane: Pane(Queue)),
                                            ])
                                    ),
                                    (size: "30%", borders: "NONE", pane: Split(direction: Vertical, panes: [
                                                (size: "0.45r", borders: "NONE", pane: Pane(AlbumArt)),
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
                                    (size: "75%", pane: Split(direction: Horizontal, panes: [
                                                (size: "25%", borders: "NONE", pane: Pane(Queue)),
                                                (size: "50%", borders: "NONE", pane: Pane(Lyrics)),
                                                (size: "25%", borders: "NONE", pane: Pane(AlbumArt)),
                                            ])
                                    ),
                                    (size: "25%", borders: "NONE", pane: Pane(Cava)),
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
                            sample_bits: 24,
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
        bat = {
            themes = {
                catppuccin = {
                    src = pkgs.fetchFromGitHub {
                        owner = "catppuccin";
                        repo = "bat"; # Bat uses sublime syntax for its themes
                        rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
                        sha256 = "6810349b28055dce54076712fc05fc68da4b8ec0";
                    };
                    file = "Dracula.tmTheme";
                };
            };
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
        flameshot = {
            settings = {
                General = {
                    useGrimAdapter = true;
                };
            };
        };
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
                    format          "44100:24:2"
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
