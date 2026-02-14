return {
  "alexxGmZ/player.nvim",
  lazy = true,
  cmd = "Player",
  config = function()
    require("player").setup({
	  supported_players = {
	 	"mpd"
	  },
    })
  end,
}
