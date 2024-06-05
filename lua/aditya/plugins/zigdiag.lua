return {
    'speed2exe/zig-comp-diag.nvim',
    config = function()
        require('zig-comp-diag').setup()

        local group = vim.api.nvim_create_augroup("ZigAnalysis", {})
        vim.api.nvim_create_autocmd('BufWritePost', {
            group = group,
            pattern = "*.zig",
            callback = function()
                -- require('zig-comp-diag').runWithCmd({ "zig", "build", "run" })
                require('zig-comp-diag').runWithCmd({ "zig", "build", "test" })
            end
        })
    end
}
