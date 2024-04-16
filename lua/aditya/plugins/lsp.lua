return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		"folke/neodev.nvim"
	},
	config = function()
		require("neodev").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd" }
		})
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace"
					}
				}
			}
		})

		require("lspconfig").clangd.setup({})
	end

}
