return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd[[colorscheme tokyonight-night]]
		local tokyo = require('tokyonight').setup({
			style = 'night',
			styles = {
				comments = { italics = true },
				keywords = { italics = true },
				functions = {},
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			transparent = true,
			terminal_colours = true,
		})
	end
}

--return {
--	"bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000,
--	config = function()
--		vim.g.nightflyNormalFloat = true
--		vim.g.nightflyUnderlineMatchParen = true
--		vim.cmd [[colorscheme nightfly]]
--	end
--}
