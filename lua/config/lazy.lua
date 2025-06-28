require("lazy").setup({
  spec = {
    { import = "plugins"},
    { import = "plugins.lsp"},
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = true },
  change_detection = { notify = false },
})
