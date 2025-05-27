return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- Reveal the current file when opening Neo-tree
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>e", ":Neotree position=right toggle<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<S-i>", function()
			require("neo-tree.sources.filesystem").toggle_hidden()
		end, { buffer = true })
	end,
}
