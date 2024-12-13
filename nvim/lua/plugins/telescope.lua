return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }

  },
  config = function()
    require('telescope').load_extension('fzf')

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "[ ] Find marks" })
  end
}
