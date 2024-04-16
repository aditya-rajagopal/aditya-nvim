return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		compilers = { "clang" },
		config = function()
			local config = require("nvim-treesitter.configs")

			config.setup({
				ensure_installed = { "c", "lua", "cpp", "json", "yaml", "glsl" },
				sync_install = false,
				auto_install = true,
				highlight = { enabled = true },
				indent = { enabled = true },
			})
		end
	},
	{
		"nvim-treesitter/playground"
	}
}
