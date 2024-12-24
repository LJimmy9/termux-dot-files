vim.opt.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.textwidth = 80

vim.o.cursorline = true
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
vim.keymap.set("n", "<leader>qq", [[:q<CR>]])
vim.keymap.set("n", "<leader>ss", [[:w<CR>]])
vim.keymap.set("n", "<leader>so", [[:so<CR>]])

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd([[silent make | copen]])
end)
vim.keymap.set("n", "<leader>rc", [[:set makeprg=]])

vim.keymap.set('n', '<leader>qf', [[:copen<CR>]])
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' },
  callback = function()
    vim.keymap.set('n', 'q', function()
      vim.cmd [[cclose | wincmd p]]
    end, { silent = true, buffer = true })
  end,
})
vim.keymap.set('t', '<Esc><Esc>', [[:cclose<CR>]])

vim.keymap.set({ "n", "v" }, "<c-a>", "_")
vim.keymap.set({ "n", "v" }, "<c-e>", "$")
vim.keymap.set({ "i" }, "<c-a>", "<c-o>_")
vim.keymap.set({ "i" }, "<c-e>", "<c-o>$")
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
require("config.autoread")
require("config.execute")
require("config.floating-term")

require("config.lazy")
