return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        "folke/neodev.nvim",
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
        require("neodev").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "gopls", "zls" }
        })
        require("lspconfig").lua_ls.setup({
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}),
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            }
        })

        require("lspconfig").clangd.setup({ capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}) })
        require("lspconfig").zls.setup({ capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}) })
        require("lspconfig").gopls.setup({ capabilities = vim.tbl_deep_extend('force', {}, capabilities, {}) })
    end

}
