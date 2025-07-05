return {
  { "nvzone/volt", lazy = true },
  { 
    "nvzone/menu", 
    lazy = true,
        keys = {
      {
        "<RightMouse>",
        function()
          local options = {
            {
              name = "󰉷 Format Buffer",
              cmd = function()
                local ok, conform = pcall(require, "conform")
                if ok then
                  conform.format { lsp_fallback = true }
                else
                  vim.lsp.buf.format()
                end
              end,
              rtxt = "<leader>fm",
            },
            {
              name = " Code Actions",
              cmd = vim.lsp.buf.code_action,
              rtxt = "<leader>ca",
            },
            { name = "separator" },
            {
              name = " Lsp Actions",
              hl = "Exblue",
              items = "lsp",
            },
            { name = "separator" },
            {
              name = " Copy Content",
              cmd = "%y+",
              rtxt = "<C-c>",
            },
            {
              name = " Delete Content",
              cmd = "%d",
              rtxt = "dc",
            },
          }
          
          require("menu").open(options, { mouse = true })
        end,
        desc = "Open Menu"
      }
    }
  }
}
