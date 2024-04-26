return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		require("neodev").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd", "pyright" },
		})
		require("lspconfig").lua_ls.setup({
			capabilities = vim.tbl_deep_extend("force", {}, capabilities, {}),
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		require("lspconfig").clangd.setup({ capabilities = vim.tbl_deep_extend("force", {}, capabilities, {}) })
		require("lspconfig").pyright.setup({
			settings = {
				pyright = { autoImportCompletion = true },
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						typeCheckingMode = "off",
					},
				},
			},
		})
	end,
}
