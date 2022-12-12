local M = {}

M.load = function()
  local api = vim.api
  local opts = { clear = true }

  -- Highlight yanked text for a moment
  local yankHl = api.nvim_create_augroup("YankHl", opts)

  api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankHl,
  })

  -- Remember last cursor position
  local lastPos = api.nvim_create_augroup("LastPos", opts)

  api.nvim_create_autocmd("BufReadPost", {
    command = 'silent! normal! g`"zv',
    group = lastPos,
  })
end

return M
