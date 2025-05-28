return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				stop_after_first = true,
			},
		})
	end,
}
