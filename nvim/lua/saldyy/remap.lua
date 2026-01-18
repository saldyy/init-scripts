local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keep it center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")

-- Harpoon keymap
vim.keymap.set("n", "<leader>bls", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set("n", "<leader>ba", '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set("n", "<leader>bn", '<cmd>lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set("n", "<leader>bp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>')

-- Tab control
-- New tab
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "tn", ":tabnext<Return>", opts)
vim.keymap.set("n", "tp", ":tabprev<Return>", opts)
-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>-")
vim.keymap.set("n", "<C-w><down>", "<C-w>+")

-- Utilities
-- convert all camel cases to underscore cases
vim.keymap.set("v", "<leader>cc", [[:s/\([a-z0-9]\)\([A-Z]\)/\1_\L\2/g<CR>]])
vim.keymap.set("v", "<leader>cu", [[:s/_\(\w\)/\U\1/g<CR>]])

-- Vim Sneak
vim.keymap.set("", "f", "<Plug>Sneak_s")
vim.keymap.set("", "F", "<Plug>Sneak_S")
