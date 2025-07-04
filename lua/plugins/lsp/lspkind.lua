return {
		{'onsails/lspkind.nvim',
	config = function()
		local status, lspkind = pcall(require, "lspkind")
		if (not status) then return end
		require('lspkind').init({
			   mode = 'symbol_text',
			       preset = 'default',
			       symbol_map = {
      		Text = "󰉿",
      		Method = "󰆧",
      		Function = "󰊕",
      		Constructor = "",
      		Field = "󰜢",
      		Variable = "󰀫",
      		Class = "󰠱",
      		Interface = "",
      		Module = "",
      		Property = "󰜢",
      		Unit = "󰑭",
      		Value = "󰎠",
      		Enum = "",
      		Keyword = "󰌋",
      		Snippet = "",
      		Color = "󰏘",
      		File = "󰈙",
     	 	Reference = "󰈇",
     	 	Folder = "󰉋",
     	 	EnumMember = "",
     	 	Constant = "󰏿",
     	 	Struct = "󰙅",
     	 	Event = "",
	      	Operator = "󰆕",
      		TypeParameter = "",
    	}
	})
	end },
}
