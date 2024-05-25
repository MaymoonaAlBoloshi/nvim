return {
	"zbirenbaum/copilot-cmp",
	after = "copilot.vim",
	config = function()
		require("copilot_cmp").setup()
	end,
}
