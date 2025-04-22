require("tokyonight").setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
	light_style = "day",

	styles = {
		comments = {bold = false, italic = true},
		keywords = {bold = true, italic = false},
		functions = {bold = false, italic = false},
		variables = {bold = false, italic = true},

		sidebars = "light",
		floats = "dark",

	},

	sidebars = {"qf", "help", "terminal"},
	hide_inactive_statusline = false, 
	dim_inactive = false, 
	lualine_bold = true, 

	on_colors = function(colors)
		colors.bg = "#000000"
		colors.bg_sidebar = "#000000"
		colors.fg_sidebar = "#c9cac9"
		colors.hint = colors.orange
		colors.error = colors.red
		colors.comment = "#696969"
		colors.fg_gutter = "#b30000"
	end,


	-- Test borderless telescope
	on_highlights = function(hl, c)
		local _red = "#b30000"
		local prompt = "#2d3149"
		local _white = "#FFFFFF"
		local _black = "#000000"
		hl.TelescopeNormal = {
			-- bg = c.bg_dark,
			bg = _black,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = _red
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			-- bg = _black,
			fg = _white,
		}
		hl.TelescopePreviewTitle = {
			-- bg = prompt,
			bg = _black,
			fg = _red,
		}
		hl.TelescopeResultsTitle = {
			-- bg = prompt,
			bg = _black,
			fg = _red,
		}
	end,


})
vim.cmd("colorscheme tokyonight-night")
