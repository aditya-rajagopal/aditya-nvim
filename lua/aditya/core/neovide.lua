vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_short_animation_length = 0
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_opacity = 1.0
vim.g.neovide_normal_opacity = 1.0
vim.g.neovide_scale_factor = 1.5
vim.api.nvim_set_keymap(
	"n",
	"<C-=>",
	":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-->",
	":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
	{ silent = true }
)
vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1.5<CR>", { silent = true })
