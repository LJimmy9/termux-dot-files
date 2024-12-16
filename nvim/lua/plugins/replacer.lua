return {
  "gabrielpoca/replacer.nvim",
  config = function()
    local opts = { save_on_write = true, rename_files = true }
    local replacer = require('replacer')

    local augroup = vim.api.nvim_create_augroup("replacer", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "replacer", -- Example filetype, change this to your desired filetype
      callback = function()
        vim.keymap.set('n', '<leader>ss', function()
          replacer.save(opts)
        end, { silent = true, buffer = true })
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "qf",
      callback = function()
        vim.keymap.set('n', '<leader>ss', function()
          replacer.run(opts)
        end, { silent = true, buffer = true })
      end,
    })
  end
}
