return {
	{"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup()
	end},

	{"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
	end},
}

