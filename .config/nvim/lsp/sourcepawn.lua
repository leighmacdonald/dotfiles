--- https://github.com/Sarrus1/sourcepawn-studio/blob/69ca16152b27d5734c2e5a876911021900b29f19/crates/sourcepawn-studio/src/config.rs#L80
---@type vim.lsp.Config
return {
    cmd = { "sourcepawn-studio", "-vv" },
    filetypes = { "sp", "inc", "sourcepawn" },
    root_markers = { ".git", "scripting" },
    --- trace = 'verbose'
    init_options = {
        includeDirectories = { "/home/leigh/sdks/sourcemod/addons/sourcemod/scripting/include" },
    },
}
