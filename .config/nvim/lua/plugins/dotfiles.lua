return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local function add(lang)
                if type(opts.ensure_installed) == "table" then
                    table.insert(opts.ensure_installed, lang)
                end
            end

            vim.filetype.add({
                extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi", gotmpl = "gotmpl", tmpl = "gotmpl" },
                filename = {
                    ["vifmrc"] = "vim",
                },
                pattern = {
                    [".*/waybar/config"] = "jsonc",
                    [".*/mako/config"] = "dosini",
                    [".*/kitty/.+%.conf"] = "kitty",
                    [".*/hypr/.+%.conf"] = "hyprlang",
                    ["%.env%.[%w_.-]+"] = "sh",
                },
            })
            vim.treesitter.language.register("bash", "kitty")

            add("git_config")
            add("hyprlang")
            add("fish")
            add("rasi")
        end,
    },
}
