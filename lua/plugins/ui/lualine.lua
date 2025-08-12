return {
	{'nvim-lualine/lualine.nvim', config = function()
require('lualine').setup()
	local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end
local spaces = {
	function()
		return " "
	end,
	padding = -1,
}

local diagnostics = {
"diagnostics",
sources = { "nvim_diagnostic" },
sections = {
	"error",
	"warn",
	"hint",
},
symbols = {
	error = " ",
	warn = " ",
	hint = " ",
	info = " ",
},
colored = true,
always_visible = false,
}

local branch = {
"branch",
icon = " 󰊢 ",
separator = { left = "", right = "" },
padding = 0.1
}

local diff = {
"diff",
colored = true,
symbols = {
	added = " ",
	modified = " ",
	removed = " ",
},
separator = { left = "", right = "" },
}

local filetype = {
"filetype",
icons_enabled = true,
}

local location = {
"location",
}

local custom_icons = {
function()
	return " "
end,
separator = { left = "", right = "" },
}

local modes = {
"mode",
separator = { left = "", right = "" },
padding = 0.8,
}

lualine.setup({
options = {
	globalstatus = true,
	icons_enabled = true,
	theme = "auto",
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
	disabled_filetypes = { "alpha", "dashboard", "packer", "neo-tree", "nvim-tree" },
	always_divide_middle = true,
},
sections = {
	lualine_a = {
		custom_icons,
		modes,
	},
	lualine_b = {
	},
	lualine_c = {
    spaces,
		{
			"filetype",
			icon_only = true,
			colored = true,
			padding = 1,
			color = { bg = "#2a2c3f" },
			separator = { left = "", right = "" },
		},
		{
			"filename",
      file_status = false,
			padding = 0.3,
			separator = { left = "", right = "" },
			color = { bg = "#2a2c3f" },
		},
		branch,
		diff,
	},
			lualine_x = {
			diagnostics,
			{
				function()
					return " "
				end,
				separator = { left = "", right = "" },
				color = { bg = "#ffb29b", fg = "#101415" },
				padding = 0.3,
			},
			"progress",
			{
				function()
					return "󰆤 "
				end,
				separator = { left = "", right = "" },
				color = { bg = "#cb92f2", fg = "#101415" },
				padding = 0.1,
			},
			location,
		},
	lualine_y = {},
	lualine_z = {},
},
})
end},
}
