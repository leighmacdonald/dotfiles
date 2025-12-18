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
        opts = { ensure_installed = { "json5", "sql", "codeql", "norg" } },
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
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                sourcepawn = {
                    settings = {
                        includeDirectories = { "/home/leigh/sdks/sourcemod/addons/sourcemod/scripting/include" },
                    },
                },
                codeqlls = {},
                bashls = {},
                ansiblels = {},
                lua_ls = {},
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
    --{
    --    "folke/trouble.nvim",
    --     {
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
    --        },
    --  },
}
