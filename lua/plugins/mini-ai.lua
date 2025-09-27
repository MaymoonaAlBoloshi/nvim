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
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)

			-- Register descriptions with which-key if installed
			local ok, wk = pcall(require, "which-key")
			if ok then
				wk.register({
					mode = { "o", "x" },
					a = {
						o = "Around block/cond/loop",
						f = "Around function",
						c = "Around class",
						t = "Around tag",
						d = "Around digit",
						e = "Around word (case)",
						u = "Around function arg",
						U = "Around function arg (strict)",
					},
					i = {
						o = "Inside block/cond/loop",
						f = "Inside function",
						c = "Inside class",
						t = "Inside tag",
						d = "Inside digit",
						e = "Inside word (case)",
						u = "Inside function arg",
						U = "Inside function arg (strict)",
					},
				})
			end
		end,
	},
}
