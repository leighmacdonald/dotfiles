return {
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
    {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "sqlfluff", "shellcheck" } },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "json5", "sql", "codeql", "norg", "cpp", "cmake", "cmakelang", "cmakelint" } },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        optional = false,
        opts = {
            transparent_background = true,
            flavour = "mocha",
            integrations = { blink_cmp = true },
        },
    },
    {
        "saghen/blink.cmp",
        opts = {
            completion = {
                -- Insert completion item on selection, don't select by default
                list = {
                    selection = {
                        auto_insert = false,
                    },
                },
            },
            keymap = {
                preset = "super-tab",
            },
        },
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            picker = {
                hidden = true,
            },
            image = { enabled = true },
            statuscolumn = {
                enabled = true,
            },
        },
    },
    {
        "nvim-neotest/neotest",
        opts = {
            adapters = {
                ["rustaceanvim.neotest"] = {},
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                sourcepawn = {
                    settings = {
                        includeDirectories = {
                            "/home/leigh/sdks/sourcemod/addons/sourcemod/scripting/include",
                            "/home/leigh/projects/gbans/sourcemod/scripting/include",
                        },
                    },
                },
                -- codeqlls = {},
                bacon_ls = {
                    enabled = diagnostics == "bacon-ls",
                },
                rust_analyzer = { enabled = false },
                bashls = {},
                ansiblels = {},
                lua_ls = {},
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                },
                neocmake = {},
                jsonls = {
                    -- lazy-load schemastore when needed
                    before_init = function(_, new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                    end,
                    settings = {
                        json = {
                            format = {
                                enable = true,
                            },
                            validate = { enable = true },
                        },
                    },
                },
            },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                sourcepawn = { "sp_format" },
            },
            formatters = {
                nixfmt = {
                    inherit = true,
                    -- command = "nixfmt",
                    append_args = { "--indent", "4" },
                },
                sp_format = {
                    inherit = false,
                    command = "sp_format",
                    args = { "--brace-wrapping-before-function", "$FILENAME" },
                },
            },
        },
    },
    {
        "pwntester/codeql.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/telescope.nvim",
            "kyazdani42/nvim-web-devicons",
            {
                "s1n7ax/nvim-window-picker",
                version = "v1.*",
                opts = {
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        bo = {
                            filetype = {
                                "codeql_panel",
                                "codeql_explorer",
                                "qf",
                                "TelescopePrompt",
                                "TelescopeResults",
                                "notify",
                                "noice",
                                "NvimTree",
                                "neo-tree",
                            },
                            buftype = { "terminal" },
                        },
                    },
                    current_win_hl_color = "#e35e4f",
                    other_win_hl_color = "#44cc41",
                },
            },
        },
        opts = {},
    },
    {
        "folke/trouble.nvim",
        opts = {
            auto_close = true,
            focus = true,
            use_diagnmostic_signs = true,
            pinned = false,
            modes = {
                diagnostics = {
                    auto_open = true,
                },
            },
        },

        --{
        --       modes = {
        --         mydiags = {
        --           mode = "diagnostics", -- inherit from diagnostics mode
        --         filter = {
        --           any = {
        --             buf = 0, -- current buffer
        --           {
        --             severity = vim.diagnostic.severity.ERROR, -- errors only
        --           -- limit to files in the current project
        --         function(item)
        --           return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
        --     end,
        --                            },
        --                      },
        --                },
        --          },
        --            },
        --},
    },
}
