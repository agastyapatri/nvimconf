return {
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
		"Mofiqul/dracula.nvim"
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
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		event = {"BufReadPost", "BufNewFile"},
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
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
		'hrsh7th/nvim-cmp',
		event = {"InsertEnter"},
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		}
	},





}
