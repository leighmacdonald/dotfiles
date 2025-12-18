return {
    { "nvim-lua/plenary.nvim" },
    { "fredrikaverpil/neotest-golang" },
    {
        "leoluz/nvim-dap-go",
        opts = {},
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "golangci-lint",
                "goimports",
                "gofumpt",
                "gomodifytags",
                "impl",
                "delve",
            },
        },
    },
    {
        "leoluz/nvim-dap-go",

        config = function()
            local dap = require("dap")
            dap.configurations.go = {
                {
                    type = "delve",
                    name = "A Debug",
                    request = "launch",
                    program = "${file}",
                    outputMode = "remote",
                    ["console"] = "integratedTerminal",
                },
            }
        end,
        opts = {
            console = "integratedTerminal",
        },
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "fredrikaverpil/neotest-golang",
        },
        opts = {
            adapters = {
                ["neotest-golang"] = {
                    -- Here we can set options for neotest-golang, e.g.
                    -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
                    dap_go_enabled = true, -- requires leoluz/nvim-dap-go
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                gopls = {
                    settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                            analyses = {
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            usePlaceholders = true,
                            completeUnimported = true,
                            staticcheck = true,
                            directoryFilters = {
                                "-.git",
                                "-.vscode",
                                "-.idea",
                                "-.vscode-test",
                                "-node_modules",
                            },
                            semanticTokens = true,
                        },
                    },
                },
            },
            setup = {
                gopls = function(_, opts)
                    -- workaround for gopls not supporting semanticTokensProvider
                    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
                    Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
                        if not client.server_capabilities.semanticTokensProvider then
                            local semantic = client.config.capabilities.textDocument.semanticTokens
                            client.server_capabilities.semanticTokensProvider = {
                                full = true,
                                legend = {
                                    tokenTypes = semantic.tokenTypes,
                                    tokenModifiers = semantic.tokenModifiers,
                                },
                                range = true,
                            }
                        end
                    end)
                    -- end workaround
                end,
            },
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            {
                "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
                branch = "main", -- NOTE; not the master branch!
                build = function()
                    vim.cmd(":TSUpdate go")
                end,
            },
            {
                "fredrikaverpil/neotest-golang",
                version = "*", -- Optional, but recommended; track releases
                build = function()
                    vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
                end,
            },
        },
        config = function()
            local config = {
                runner = "gotestsum", -- Optional, but recommended
            }
            require("neotest").setup({
                adapters = {
                    require("neotest-golang")(config),
                },
            })
        end,
    },
}
