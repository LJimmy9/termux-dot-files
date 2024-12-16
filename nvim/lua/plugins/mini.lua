return {
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup({
      mappings = {
        add = 'za',            -- Add surrounding in Normal and Visual modes
        delete = 'zd',         -- Delete surrounding
        find = 'zf',           -- Find surrounding (to the right)
        find_left = 'zF',      -- Find surrounding (to the left)
        highlight = 'zh',      -- Highlight surrounding
        replace = 'zr',        -- Replace surrounding
        update_n_lines = 'zn', -- Update `n_lines`

        suffix_last = 'l',     -- Suffix to search with "prev" method
        suffix_next = 'n',     -- Suffix to search with "next" method
      },
    })
    require("mini.bracketed").setup()
    require("mini.jump").setup()
  end,
}
