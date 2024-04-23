function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.cmd 'highlight TelescopeBorder guibg=none'
    vim.cmd 'highlight TelescopeTitle guibg=none'
end

-- return {
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         config = function()
--             require('rose-pine').setup({
--                 disable_background = true,
--                 styles = {
--                     italic = false,
--                 },
--             })
--             vim.cmd("colorscheme rose-pine")
--             ColorMyPencils()
--         end
--     }
-- }

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd [[colorscheme tokyonight-night]]
        require('tokyonight').setup({
            style = 'night',
            styles = {
                comments = { italics = true },
                keywords = { italics = true },
                functions = {},
                variables = {},
                sidebars = "dark",
                floats = "dark",
            },
            transparent = false,
            terminal_colours = true,
        })
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.cmd 'highlight TelescopeBorder guibg=none'
        vim.cmd 'highlight TelescopeTitle guibg=none'
        vim.cmd 'highlight SignColumn guibg=none'
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
