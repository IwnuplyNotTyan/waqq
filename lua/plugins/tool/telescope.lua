return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  cmd = "Telescope",
  keys = {
    { "m", "<cmd>Telescope buffers<cr>", desc = "Telescope" },
 --   { "n", "<cmd>Telescope find_files<cr>", desc = "Telescope" },
  },
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
