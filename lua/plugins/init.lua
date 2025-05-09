return {
	{
		"mason-org/mason.nvim"
	},
	{	
		'tpope/vim-fugitive',
		event = 'VeryLazy',
	},
	{	
		'tpope/vim-rhubarb',
		event = 'VeryLazy',

	},
	-- 	COLORSCHEMES 
	{	
		"folke/tokyonight.nvim"
	},
	{
		'windwp/nvim-autopairs',
		event = 'VeryLazy',
		config = function() require("nvim-autopairs").setup {} end
	},
	{	
		'lukas-reineke/indent-blankline.nvim',	
		event = 'VeryLazy',
		main="ibl", 
		opts={}
	},
	{
		'akinsho/toggleterm.nvim', 
		event = 'VeryLazy',
		version = "*", 
		config = true,

	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false, 
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		enabled = true, 
		lazy = false, 
		opts = {
			options = {
				icons_enabled = false,
				theme = 'ayu_dark',
				component_separators = '|',
				section_separators = '',
			},
		},

	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({'n', 'v'}, ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
				vim.keymap.set({'n', 'v'}, '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
			end,
		},
	},


	{
		'nvim-telescope/telescope.nvim',
		event = 'VeryLazy',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		event = {"BufReadPre"},
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		}
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = 'enter' },

			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	}
}

