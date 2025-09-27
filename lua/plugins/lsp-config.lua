return {
	-- Installer
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},

	-- Bridge Mason <-> lspconfig (install helpers, :LspInstall, etc.)
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"ts_ls", -- NOTE: was "tsserver"
				"eslint",
				"gopls",
				"pyright",
				"tailwindcss",
				"lua_ls",
				"html",
			},
			automatic_enable = false, -- we enable servers manually via vim.lsp.enable(...)
		},
	},

	-- LSP configs (native API)
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Defaults for all servers (can be overridden per server)
			vim.lsp.config("*", {
				capabilities = capabilities,
				root_markers = { ".git" },
			})

			-- TypeScript / JavaScript
			vim.lsp.config("ts_ls", {
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
				on_attach = function(client, _)
					-- let prettier/conform handle formatting
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			-- HTML
			vim.lsp.config("html", {})

			-- Lua
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Python
			vim.lsp.config("pyright", {})

			-- Go
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						usePlaceholders = true,
						analyses = { unusedparams = true },
					},
				},
			})

			-- TailwindCSS
			vim.lsp.config("tailwindcss", {})

			-- ESLint
			vim.lsp.config("eslint", {})

			-- Enable all configured servers
			vim.lsp.enable({ "ts_ls", "html", "lua_ls", "pyright", "gopls", "tailwindcss", "eslint" })

			-- Buffer-local keymaps on LSP attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("my_lsp_keys", { clear = true }),
				callback = function(args)
					local buf = args.buf
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true })
					end

					map("n", "K", vim.lsp.buf.hover)
					map("n", "gd", vim.lsp.buf.definition)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>vca", vim.lsp.buf.code_action)
					map("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
					map("n", "<leader>vd", vim.diagnostic.open_float)
					map("n", "<leader>vrr", vim.lsp.buf.references)
					map("n", "<leader>vh", vim.lsp.buf.signature_help)
				end,
			})
		end,
	},
}
