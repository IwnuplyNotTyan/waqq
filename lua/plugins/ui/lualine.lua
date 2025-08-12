return {'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		-- Кастомная цветовая схема на основе вашей темы
		local colors = {
			bg = '#0B0F10',
			fg = '#c5c8c9',
			black = '#101415',
			black_light = '#131718',
			red = '#df5b61',
			red_light = '#ee6a70',
			green = '#87c7a1',
			green_light = '#96d6b0',
			yellow = '#de8f78',
			yellow_light = '#ffb29b',
			blue = '#6791c9',
			blue_light = '#7ba5dd',
			magenta = '#bc83e3',
			magenta_light = '#cb92f2',
			cyan = '#70b9cc',
			cyan_light = '#7fc8db',
			white = '#c4c4c4',
			white_light = '#cccccc',
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
				b = { fg = colors.fg, bg = colors.black_light },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
				b = { fg = colors.fg, bg = colors.black_light },
				c = { fg = colors.fg, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.magenta, gui = 'bold' },
				b = { fg = colors.fg, bg = colors.black_light },
				c = { fg = colors.fg, bg = colors.bg },
			},
			command = {
				a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
				b = { fg = colors.fg, bg = colors.black_light },
				c = { fg = colors.fg, bg = colors.bg },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
				b = { fg = colors.fg, bg = colors.black_light },
				c = { fg = colors.fg, bg = colors.bg },
			},
			inactive = {
				a = { fg = colors.white, bg = colors.black },
				b = { fg = colors.white, bg = colors.black },
				c = { fg = colors.white, bg = colors.black },
			},
		}

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = custom_theme,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						'WinEnter',
						'BufEnter',
						'BufWritePost',
						'SessionLoadPost',
						'FileChangedShellPost',
						'VimResized',
						'Filetype',
						'CursorMoved',
						'CursorMovedI',
						'ModeChanged',
					},
				}
			},
			sections = {
				lualine_a = {
					{
						'mode',
						icon = '',
						fmt = function(str)
							return str:sub(1,1):upper()..str:sub(2):lower()
						end,
					}
				},
				lualine_b = {
					{
						'branch',
						icon = '',
						color = { fg = colors.cyan_light, gui = 'bold' }
					},
					{
						'diff',
						symbols = {
							added = ' ',
							modified = ' ',
							removed = ' '
						},
						diff_color = {
							added = { fg = colors.green_light },
							modified = { fg = colors.yellow_light },
							removed = { fg = colors.red_light },
						},
					},
					{
						'diagnostics',
						symbols = {
							error = ' ',
							warn = ' ',
							info = ' ',
							hint = ' ',
						},
						diagnostics_color = {
							error = { fg = colors.red_light },
							warn = { fg = colors.yellow_light },
							info = { fg = colors.blue_light },
							hint = { fg = colors.cyan_light },
						},
					}
				},
				lualine_c = {
					{
						'filename',
						file_status = true,
						newfile_status = false,
						path = 1,
						shorting_target = 40,
						symbols = {
							modified = ' ●',
							readonly = ' ',
							unnamed = '[Без названия]',
							newfile = '[Новый]',
						},
						color = { fg = colors.white_light, gui = 'italic' }
					}
				},
				lualine_x = {
					-- LSP статус
					{
						function()
							local clients = vim.lsp.get_active_clients({ bufnr = 0 })
							if next(clients) == nil then
								return ''
							end
							local client_names = {}
							for _, client in pairs(clients) do
								table.insert(client_names, client.name)
							end
							return ' ' .. table.concat(client_names, ', ')
						end,
						color = { fg = colors.magenta_light },
					},
					{
						'encoding',
						icon = '',
						color = { fg = colors.blue_light }
					},
					{
						'fileformat',
						symbols = {
							unix = ' Unix',
							dos = ' DOS',
							mac = ' Mac',
						},
						color = { fg = colors.blue_light }
					},
					{
						'filetype',
						colored = true,
						icon_only = false,
						icon = { align = 'right' },
						color = { fg = colors.cyan_light }
					}
				},
				lualine_y = {
					{
						'progress',
						icon = '',
						color = { fg = colors.green_light, gui = 'bold' }
					}
				},
				lualine_z = {
					{
						'location',
						icon = '',
						color = { fg = colors.yellow_light, gui = 'bold' }
					}
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						'filename',
						color = { fg = colors.white }
					}
				},
				lualine_x = {
					{
						'location',
						color = { fg = colors.white }
					}
				},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { 'nvim-tree', 'lazy', 'mason', 'trouble' }
		}
	end
}
