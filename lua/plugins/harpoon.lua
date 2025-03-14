return {
    "theprimeagen/harpoon",

    config = function()
        local harpoon_mark = require("harpoon.mark")
        local harpoon_ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file)
        vim.keymap.set("n", "<leader>hm", harpoon_ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>1", function()
         harpoon_ui.nav_file(1)
        end)
        vim.keymap.set("n", "<leader>2", function()
	        harpoon_ui.nav_file(2)
        end)
        vim.keymap.set("n", "<leader>3", function()
	        harpoon_ui.nav_file(3)
        end)
        vim.keymap.set("n", "<leader>4", function()
	        harpoon_ui.nav_file(4)
        end)
    end,
}
