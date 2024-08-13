-- return {
--     "rose-pine/neovim",
--     lazy = false,
--     name = "rose-pine",
--     priority = 1000,
--
--     config = function()
--         require("rose-pine").setup({
--             variant = "main",
--         })
--         vim.cmd("colorscheme rose-pine")
--
--         -- Set background transparency
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
-- }

-- return {
-- 	"gruvbox-community/gruvbox",
-- 	lazy = false,
-- 	name = "gruvbox",
-- 	priority = 1000,
--
-- 	config = function()
-- 		vim.cmd("colorscheme gruvbox")
--
-- 		-- Set background transparency
-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	end,
-- }

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            transparent_background = true, -- Enable transparent background
            term_colors = true,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
                lsp_trouble = true,
                cmp = true,
                gitsigns = true,
                telescope = true,
                nvimtree = {
                    enabled = true,
                    show_root = false,
                },
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                dashboard = true,
                bufferline = true,
                markdown = true,
                lightspeed = true,
                ts_rainbow = true,
                hop = true,
                notify = true,
                symbols_outline = true,
            },
        })
        vim.cmd("colorscheme catppuccin")

        -- Set additional highlights for transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
    end,
}
