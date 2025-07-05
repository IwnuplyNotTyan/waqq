return {
	{ "nvim-tree/nvim-web-devicons"},
	{"rebelot/kanagawa.nvim", priority = 1000, config = function()
    require('kanagawa').setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,         -- do not set background color
        dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,      -- define vim.g.terminal_color_{0,17}
        colors = {                  -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "wave",             -- Load "wave" theme when 'background' option is not set
        background = {              -- map the value of 'background' option to a theme
            dark = "wave",          -- try "dragon" !
            light = "lotus"
        }
    })
    vim.cmd.colorscheme "kanagawa-dragon"
	end},
{"folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = "100%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
    })
  end,},
  	{"MunifTanjim/nui.nvim"},
   	{"rcarriga/nvim-notify"},
	{'anuvyklack/animation.nvim',
	config = function()
	   requires = 'anuvyklack/middleclass'
   	end
	},
	{'goolord/alpha-nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' },
	    config = function ()
	        require'alpha'.setup(require'alpha.themes.startify'.config)
	    end
	};
	{'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end},
	{"antoinemadec/FixCursorHold.nvim"},
}
