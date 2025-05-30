local cmp = require("cmp")

-- Ensure cmp-copilot is required and setup is invoked
require("copilot_cmp").setup()


return {
	"hrsh7th/nvim-cmp",
	opts = {
		enabled = function()
			local context = require("cmp.config.context")
			local disabled = false
			disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
			disabled = disabled or (vim.fn.reg_recording() ~= "")
			disabled = disabled or (vim.fn.reg_executing() ~= "")
			disabled = disabled or context.in_treesitter_capture("comment")
			return not disabled
		end,
		sources = {
			{ name = "copilot" },
			{ name = "buffer" },
			{ name = "path", group_index = 2 },
			{ name = "luasnip", group_index = 2 },
			{ name = "nvim_lsp" },
			{ name = "copilot-cmp" },
		},
		mapping = {
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),
		},
	},
}
