vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false

vim.opt.backup = false

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>qq", ":q<CR>")
vim.keymap.set("n", "<leader>ss", ":w<CR>")
vim.keymap.set("n", "<leader>so", ":so<CR>")



require("config.lazy")
