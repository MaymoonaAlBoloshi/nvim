return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({})
        -- make margin bigger
        vim.cmd("highlight ZenModeIndent guibg=none guifg=#4b5263")
    end,
}
