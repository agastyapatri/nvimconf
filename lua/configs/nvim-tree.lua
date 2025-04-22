vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1 
vim.opt.termguicolors = true 
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",	
	},
	view = {
		width = 30
	},
	renderer = {
		group_empty = true
	},
	filters = {
		dotfiles = true
	},

})
vim.keymap.set({"n", "i"}, "<A-1>", vim.cmd.NvimTreeOpen)
vim.keymap.set({"n", "i"}, "<A-2>", vim.cmd.NvimTreeClose)
