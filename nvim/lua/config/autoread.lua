vim.o.autoread = true -- Only works for file changes detected outside of vim

local auto_reload_group = vim.api.nvim_create_augroup("AutoReload", { clear = true })

-- Autocommands to check for file changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = auto_reload_group,
  pattern = "*",
  callback = function()
    vim.cmd("silent! checktime")
  end
})

vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  group = auto_reload_group,
  pattern = { "*.*" },
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = auto_reload_group,
  pattern = { "*.*" },
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})
