return {
	{
		"stevearc/quicker.nvim",
		opts = {},
		config = function()
			local quicker = require("quicker")
			vim.keymap.set("n", "<C-q>", function()
				quicker.toggle()
			end)
			quicker.setup({
				keys = {
					{
						">",
						function()
							require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
						end,
						desc = "Expand quickfix context",
					},
					{
						"<",
						function()
							require("quicker").collapse()
						end,
						desc = "Collapse quickfix context",
					},
				},
			})
		end,
	},
}
