return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Keymap for opening Neo-tree on the left and revealing the current file
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		-- Toggle Neo-tree visibility with leader key + e
		vim.keymap.set("n", "<leader>e", ":Neotree position=right toggle<CR>", {})
		-- Reveal buffers in a floating window with leader key + bf
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

		-- Toggle hidden files in Neo-tree with Shift+I when focused on the tree
		vim.keymap.set("n", "<S-i>", function()
			require("neo-tree.sources.filesystem").toggle_hidden()
		end, { buffer = true })
	end,
}
