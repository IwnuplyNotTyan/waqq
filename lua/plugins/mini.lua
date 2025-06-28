return {
		{'MeanderingProgrammer/render-markdown.nvim',
	    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	    ---@module 'render-markdown'
	    ---@type render.md.UserConfig
	    opts = {},
    	},
	{'echasnovski/mini.nvim',
		config = function()
			require('mini.pairs').setup()
			require('mini.surround').setup()
			require('mini.comment').setup()
			require('mini.indentscope').setup()
		end},

}
