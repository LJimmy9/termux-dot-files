return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'gruvbox-material',
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  }
}
