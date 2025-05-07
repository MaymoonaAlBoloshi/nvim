-- General keymaps
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>")

-- disable control z to avoid suspending neovim
vim.keymap.set("n", "<C-z>", "<Nop>", { noremap = true })


-- quality of life
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste without yanking" })  -- paste without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" }) -- delete without yanking

-- files keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)                                -- open command line window
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })       -- save file
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Close file" })      -- close file
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", { desc = "Zen mode" }) -- zen mode

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
-- i don't like tabs
-- vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
-- vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
-- vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab

-- move between split windows
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to left split" })   -- move to left split
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to bottom split" }) -- move to bottom split
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to top split" })    -- move to top split
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to right split" })  -- move to right split
