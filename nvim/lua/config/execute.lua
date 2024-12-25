local exec_lua = vim.api.nvim_replace_termcodes(':lua<CR>', true, false, true)
vim.keymap.set({ "v" }, "<leader>exl", function() vim.api.nvim_feedkeys(exec_lua, 't', false) end)


vim.keymap.set("n", "<leader>rr", function()
  vim.cmd([[silent make | copen]])
end)

local function custom_makeprg(input)
  local output = string.gsub(input, [[ ]], [[\ ]])
  local cmd = ":set makeprg=" .. output
  print(cmd)
  vim.cmd(cmd)
end

vim.api.nvim_create_user_command("MakePrg", function(opts)
  custom_makeprg(opts.args)
end, { nargs = "+" })

vim.keymap.set("n", "<leader>rc", [[:MakePrg ]])
