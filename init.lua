--	OPTIONS
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.scrolloff = 10
vim.api.nvim_set_hl(0, "Cursor", {bg = '#00D203'})
vim.opt.guicursor = {"i:block-Cursor"}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.hlsearch = false
vim.o.background = "dark"
vim.opt.cursorline = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.cindent = true 
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 50
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- DISABLING UNUSED BUILTINS 
local disabled_builtins = {
	"gzip", "zip", "tar", "netrw", "shada_plugin", "tutor", "matchparen", "rplugin", "remote_plugins"
}
for _, plugin in pairs(disabled_builtins) do
	vim.g["loaded_" .. plugin] = 1
end


-- DISABLING UNUSED FILES 
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false



local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	--	go to lua/plugins for the modules of all the installed plugins 
	spec = {
		import = 'plugins'
	},
	ui = {
		border = "double", 
		size = {
			width = 0.8,
			height = 0.8,
		},
	},
}, {}
)
-- require("configs.tokyonight")
require("configs.kanso")
require("configs.indent-blankline")
-- require("configs.nvim-lspconfig")
require("configs.treesitter")
require("configs.toggleterm")
require("configs.telescope")
require("configs.nvim-tree")
-- require("configs.nvim-cmp")
require("configs.noice")
require("configs.mason")


--	KEYMAPS: tabs and splits
vim.keymap.set({"n", "v", "i"}, "<C-n>", vim.cmd.tabnew)
vim.keymap.set({"n", "v", "i"}, "<A-l>", vim.cmd.tabn)
vim.keymap.set({"n", "v", "i"}, "<A-h>", vim.cmd.tabp)
vim.keymap.set({"n", "v", "i"}, "<A-s>", vim.cmd.vsplit)
vim.keymap.set('n', '<leader>th', '<Cmd>-tabmove<CR>')
vim.keymap.set('n', '<leader>tl', '<Cmd>+tabmove<CR>')



--	KEYMAPS: diagnostics
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })




-- LSP STUFF; diagnostics, servers, autocomplete and more fun
vim.diagnostic.config({
	underline = true,
	signs=true,
	virtual_text = true,
	float = {
		border = 'rounded',
	}
})

-- enabling lsp servers ; take a look at ~/.config/nvim/lsp for more info 
vim.lsp.enable({'clangd', 'pyright', 'lua_ls'})
--
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method('textDocument/completion') then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })
--
--	HIGHLIGHT ON YANK
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})










