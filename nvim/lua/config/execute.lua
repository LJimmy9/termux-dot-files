local exec_lua = vim.api.nvim_replace_termcodes(':lua<CR>', true, false, true)
vim.keymap.set({ "v" }, "<leader>exl", function() vim.api.nvim_feedkeys(exec_lua, 't', false) end)
