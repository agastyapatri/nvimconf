local highlight = {
	"White"
	-- "Yellow"
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- vim.api.nvim_set_hl(0, "Yellow", { fg = "#FFF800" })
    vim.api.nvim_set_hl(0, "White", { fg = "#B2B8CF" })
    -- vim.api.nvim_set_hl(0, "White", { fg = "#FFFFFF" })
    -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }

