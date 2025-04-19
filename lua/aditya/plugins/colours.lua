function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.cmd("highlight TelescopeBorder guibg=none")
	vim.cmd("highlight TelescopeTitle guibg=none")
end

-- return {
-- 	{
-- 		"rose-pine/neovim",
-- 		name = "rose-pine",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("rose-pine").setup({
-- 				-- disable_background = true,
-- 				styles = {
-- 					italic = false,
-- 				},
-- 				highlight_groups = {
-- 					["@lsp.type.comment.cpp"] = { fg = "muted" },
-- 				},
-- 			})
-- 			ColorMyPencils("rose-pine")
-- 		end,
-- 	},
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "night",
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			transparent = false,
			disable_background = true,
			terminal_colours = true,
		})
		ColorMyPencils("tokyonight-storm")
		vim.cmd("highlight SignColumn guibg=none")
	end,
}

--return {
--	"bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000,
--	config = function()
--		vim.g.nightflyNormalFloat = true
--		vim.g.nightflyUnderlineMatchParen = true
--		vim.cmd [[colorscheme nightfly]]
--	end
--}
