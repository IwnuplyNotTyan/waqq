return 	{'NeogitOrg/neogit',
		lazy = true;
		cmd = "Neogit",
		keys = {
			{ "b", "<cmd>Neogit<cr>", desc = "Neogit" },
		},
		config = function()
		local neogit = require('neogit')
		neogit.setup {}
		end}
