return {
	{'echasnovski/mini.nvim',
		config = function()
			require('mini.pairs').setup()
			require('mini.surround').setup()
			require('mini.comment').setup()
			require('mini.indentscope').setup()
		end},

}
