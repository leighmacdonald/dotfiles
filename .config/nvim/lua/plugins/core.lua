return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin",
    optional = false,
    opts = {
      integrations = { blink_cmp = true },
    },
  },
  { "Civitasv/cmake-tools.nvim", opts = {} },
}
