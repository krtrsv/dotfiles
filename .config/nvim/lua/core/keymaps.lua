local M = {}

function M.zen_toggle()
  if vim.g.zen then
    vim.g.zen = false
    vim.cmd([[ set laststatus=2 ]])
  else
    vim.g.zen = true
    vim.cmd([[ set laststatus=1 ]])
  end
end

M.load = function()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  map("", "<Space>", "<Nop>", opts)
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  map("n", "<ESC>", ":nohl<CR>", opts)
  map("n", "<INS>", ":wqa!<CR>", opts)
  map("n", "<TAB>", ":bn<CR>", opts)
  map("n", "<S-TAB>", ":bp<CR>", opts)
  map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
  map("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
  map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
  map("n", "<F1>", ":NvimTreeToggle<cr>", opts)
  map("n", "<F2>", ":lua require'core.keymaps'.zen_toggle()<cr>", opts)
  map("n", "<leader>hh", ":HopWord<cr>", opts)
  map("n", "<leader>hl", ":HopLine<cr>", opts)
end

return M
