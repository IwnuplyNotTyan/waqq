require("lazy").setup({
  spec = {
    { import = "plugins"},	-- All plugins
    { import = "plugins.lsp"},  -- LSP
    { import = "plugins.hydra"},-- Hydra
  },
  defaults = {
    lazy = false,
    version = false,
  },
})

