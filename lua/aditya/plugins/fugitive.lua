return {
    'tpope/vim-fugitive',
    lazy = false,
    config = function()
        -- require("nvim-fugitive").setup({})
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}
