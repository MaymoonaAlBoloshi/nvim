return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		ensure_installed = {
			"tsserver",
			"eslint",
			"gopls",
			"pyright",
			"tailwindcss",
		},
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = require("cmp_nvim_lsp").on_attach
			local lspconfig = require("lspconfig")

			-- Updated tsserver setup
			lspconfig.tsserver.setup({
                capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {})
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, {})
		end,
	},
}
