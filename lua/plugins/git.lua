return {
	{'NeogitOrg/neogit',
		config = function()
		local neogit = require('neogit')
		neogit.setup {}
		end},
	{'lewis6991/gitsigns.nvim',
	config = function()
		require('gitsigns').setup()
	end},
}
