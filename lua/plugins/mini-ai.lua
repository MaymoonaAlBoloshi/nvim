return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
					d = { "%f[%d]%d+" },
					e = {
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(),
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]+" }), -- match full names
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)

			-- which-key (v3 spec) descriptions for mini.ai textobjects
			local ok, wk = pcall(require, "which-key")
			if ok then
				wk.add({
					mode = { "o", "x" },
					{ "aU", desc = "Around function arg (strict)" },
					{ "ac", desc = "Around class" },
					{ "ad", desc = "Around digit" },
					{ "ae", desc = "Around word (case)" },
					{ "af", desc = "Around function" },
					{ "ao", desc = "Around block/cond/loop" },
					{ "at", desc = "Around tag" },
					{ "au", desc = "Around function arg" },
					{ "iU", desc = "Inside function arg (strict)" },
					{ "ic", desc = "Inside class" },
					{ "id", desc = "Inside digit" },
					{ "ie", desc = "Inside word (case)" },
					{ "if", desc = "Inside function" },
					{ "io", desc = "Inside block/cond/loop" },
					{ "it", desc = "Inside tag" },
					{ "iu", desc = "Inside function arg" },
				})
			end
		end,
	},
}
