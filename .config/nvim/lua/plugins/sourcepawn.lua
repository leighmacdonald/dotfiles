return {
    {
        "nvim-treesitter/nvim-treesitter",
        ---@param opts TSConfig
        opts = function(_, opts)
            require("nvim-treesitter.config").setup(opts)

            require("nvim-treesitter.parsers").sourcepawn = {
                install_info = {
                    url = "https://github.com/nilshelmig/tree-sitter-sourcepawn",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "sp",
            }
        end,
    },
}
