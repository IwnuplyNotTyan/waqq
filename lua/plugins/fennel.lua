return {
{
  "rktjmp/hotpot.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("hotpot").setup({
      provide_require_fennel = true,
      enable_hotpot_diagnostics = true,
      compiler = {
        modules = {
          correlate = true
        }
      }
    })
    require("config.config")
  end
}
}
