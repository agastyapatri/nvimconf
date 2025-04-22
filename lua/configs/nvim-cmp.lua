-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load({paths = {"./snippets"}})
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

-- --	SETTING THE BACKGROUND COLOR OF THE COMPLETION ENGINE 
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#000000", fg="#FFFFFF" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000", fg="#FFFFFF" })
require("cmp").setup({
		window = {
				completion = {
						border = "rounded",
						winhighlight = "Normal:CmpNormal",
					},
					documentation = {
							border = "rounded",
							winhighlight = "Normal:Pmenu",
						}
					}
				})


				-- --------------------------
				-- 	ADDING SNIPPETS 
				-- --------------------------
				-- local ls = require "luasnip"
				-- local snip = ls.snippet
				-- local node = ls.snippet_node
				-- local text = ls.text_node
				-- local insert = ls.insert_node
				-- local func = ls.function_node
				-- local choice = ls.choice_node
				-- local dynamic = ls.dynamic_node

