-- TODO: Multiple window tabs
-- TODO: Multiple types

---@alias FloatingOpts { mode_override: 'n'|'i' }
---@type FloatingOpts
local opts = {
  mode_override = 'i'
}

---@alias FloatingState { width:number|nil, height: number|nil, buf: number, win: number }
---@type { floating_term: FloatingState }
local state = {
  floating_term = {
    width = nil,
    height = nil,
    buf = -1,
    win = -1
  }
}

---@param opts FloatingState|nil Options for the floating window.
---   - `width`: number Optional width of the window.
---   - `height`: number Optional height of the window.
---   - `buf`: number Optional buffer to reuse; if invalid or not provided, a new one is created.
---   - `win`: number Optional window to reuse; if invalid or not provided, a new one is created.
---@return FloatingState Floating state containing:
---   - `width`: number The width of the window
---   - `height`: number The height of the window
---   - `buf`: number The buffer number used for the window.
---   - `win`: number The window ID of the created floating window.
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8 - 2) -- -2 for cmdline and statusline

  -- Set the buffer
  local buf = -1
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Set the window buffer
  local win = -1
  print("Checking!", win, opts.win, opts.buf)
  if vim.api.nvim_win_is_valid(opts.win) then
    vim.api.nvim_win_hide(opts.win)
  else
    -- Set up the options for the floating window
    local win_opts = {
      relative = "editor",
      width = width,
      height = height,
      col = (vim.o.columns - width) / 2,
      row = (vim.o.lines - height) / 2 - 1,
      anchor = "NW",
      style = "minimal",
      border = "rounded"
    }
    win = vim.api.nvim_open_win(buf, true, win_opts)
    if vim.bo[buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
    vim.cmd([[startinsert]])
  end

  return { width = width, height = height, buf = buf, win = win }
end

vim.api.nvim_create_user_command("Floaterminal", function()
  state.floating_term = create_floating_window(state.floating_term)
end, {})

local function toggle_float_term()
  local keys = '<C-[>:Floaterminal<CR>'
  local cmd = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(cmd, 't', false)
end

vim.keymap.set({ 'n', 't' }, '<leader>tt', toggle_float_term)
