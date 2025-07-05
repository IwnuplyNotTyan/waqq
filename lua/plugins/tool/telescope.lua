return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
    })
  end,
}
