local M = {}

M.load = function()
  local opt = vim.opt

  -- Break lines at whitespace
  opt.linebreak = true

  -- Round indent to shiftwidth
  opt.shiftround = true

  -- Use spaces instead of tabs
  opt.expandtab = true

  -- Number of spaces for indentation
  opt.shiftwidth = 2

  -- Use system clopboard
  opt.clipboard = "unnamedplus"

  -- Display numbers
  opt.number = true

  -- Increase number column width
  opt.numberwidth = 6

  -- Display non-displayable characters
  opt.list = true

  -- Display tabs and trailing spaces
  opt.listchars = { tab = "␉·", trail = "•" }

  --Ignore case in search...
  opt.ignorecase = true

  -- ...unless uppercase character is provided
  opt.smartcase = true

  -- Enable RGB in terminal
  opt.termguicolors = true

  -- Keep 5 lines abowe and below cursor
  opt.scrolloff = 5

  -- Don't show mode
  opt.showmode = false

  -- Display signs in number column
  opt.signcolumn = "number"

  -- interval for writing swap file to disk also used by gitsigns
  opt.updatetime = 250

  -- Highlight current line
  opt.cursorline = true

  -- Remove cmd line
  -- opt.cmdheight = 0

  -- Menu pseudo transparency (nvim-cmp)
  opt.pumblend = 15
end

return M
