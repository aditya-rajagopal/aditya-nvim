function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.cmd("highlight TelescopeBorder guibg=none")
	-- vim.cmd("highlight TelescopeTitle guibg=none")
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
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = { "italic" },
				strings = { "italic" },
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "nocombine" },
				operators = {},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				telescope = {
					enabled = true,
				},
				harpoon = true,
			},
			custom_highlights = function(colours)
				return {
					["@module"] = { fg = colours.teal },
					-- Zig highlights
					["@lsp.type.errorTag.zig"] = { fg = colours.maroon },
					["@lsp.type.builtin.zig"] = { fg = colours.yellow, style = { "bold" } },
					["@lsp.type.method.zig"] = { fg = colours.sky, style = { "italic" } },
				}
			end,
		})
		ColorMyPencils("catppuccin")
	end,
}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		---@diagnostic disable-next-line: missing-fields
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			styles = {
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = {},
-- 				variables = {},
-- 				sidebars = "dark",
-- 				floats = "dark",
-- 			},
-- 			transparent = false,
-- 			disable_background = true,
-- 			terminal_colours = true,
-- 			---@param highlights tokyonight.Highlights
-- 			---@param colors ColorScheme
-- 			on_highlights = function(highlights, colors)
-- 				-- zig colours
-- 				highlights["@lsp.typemod.method.declaration.zig"] = {
-- 					fg = "#bb0000",
-- 				}
-- 				highlights["@lsp.type.string.zig"] = {
-- 					fg = "#bb0000",
-- 				}
-- 			end,
-- 		})
-- 		ColorMyPencils("tokyonight-storm")
-- 		vim.cmd("highlight SignColumn guibg=none")
-- 	end,
-- }

--return {
--	"bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000,
--	config = function()
--		vim.g.nightflyNormalFloat = true
--		vim.g.nightflyUnderlineMatchParen = true
--		vim.cmd [[colorscheme nightfly]]
--	end
--}
