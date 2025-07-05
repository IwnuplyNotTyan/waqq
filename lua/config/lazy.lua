require("lazy").setup({
  spec = {
    { import = "plugins"},	 -- All plugins
    { import = "plugins.lsp"},   -- LSP
    { import = "plugins.hydra"}, -- Hydra
    { import = "plugins.ui"},    -- UI
    { import = "plugins.ai"},    -- AI
    { import = "plugins.render"},-- Render Markdown, Norg
    { import = "plugins.git"},   -- Git
  },
  defaults = {
    lazy = false,
    version = false,
  },
})

