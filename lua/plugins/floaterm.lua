return {
	"voldikss/vim-floaterm",
	config = function()
		vim.g.floaterm_width = 0.9
		vim.g.floaterm_height = 0.9
		-- Toggle floating terminal with Alt+i
		vim.keymap.set({ "n", "t" }, "<A-i>", "<cmd>FloatermToggle<CR>", { silent = true })
		-- Create a new floating terminal tab with Alt+n
		vim.keymap.set({ "n", "t" }, "<A-n>", "<cmd>FloatermNew<CR>", { silent = true })
		-- Go to the next floating terminal tab with Alt+p
		vim.keymap.set({ "n", "t" }, "<A-p>", "<cmd>FloatermNext<CR>", { silent = true })
		-- Go to the previous floating terminal tab with Alt+P (Shift+Alt+p)
		vim.keymap.set({ "n", "t" }, "<A-o>", "<cmd>FloatermPrev<CR>", { silent = true })
	end,
}
