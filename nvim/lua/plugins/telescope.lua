return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require("telescope.builtin")
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            -- To ensure folds are preserved https://github.com/nvim-telescope/telescope.nvim/issues/559
            ["<CR>"] = function()
              vim.cmd [[stopinsert]]
              vim.cmd [[call feedkeys("\<CR>")]]
            end,
            ["<C-q>"] = function(action, pre)
              actions.smart_send_to_qflist(action, pre)
              vim.cmd [[call feedkeys(" qf ss")]]
            end,
            ["<C-d>"] = actions.delete_buffer,
          },
        }
      }
    })

    telescope.load_extension('fzf')

    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>ff",
      function()
        builtin.find_files({ find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        })
      end, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    -- vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>fj", builtin.current_buffer_fuzzy_find,
      { desc = "[S]earch buffer by [G]rep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles,
      { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[ ] Find marks" })
    vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "[ ] Find symbols" })
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[ ] Find symbols" })
  end
}
