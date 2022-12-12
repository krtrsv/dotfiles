local M = {}

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local util = require("lspconfig/util")
local path = util.path

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  local diag = vim.diagnostic
  local map = vim.keymap.set
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local buf = vim.lsp.buf
  map("n", "<space>e", diag.open_float, opts)
  map("n", "[d", diag.goto_prev, opts)
  map("n", "]d", diag.goto_next, opts)
  map("n", "<space>q", diag.setloclist, opts)
  map("n", "gD", buf.declaration, bufopts)
  map("n", "gd", buf.definition, bufopts)
  map("n", "K", buf.hover, bufopts)
  map("n", "gi", buf.implementation, bufopts)
  map("n", "<C-k>", buf.signature_help, bufopts)
  map("n", "<space>D", buf.type_definition, bufopts)
  map("n", "<space>rn", buf.rename, bufopts)
  map("n", "<space>ca", buf.code_action, bufopts)
  map("n", "gr", buf.references, bufopts)
  map("n", "<space>f", buf.format, bufopts)
end

M.orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return M.orig_util_open_floating_preview(contents, syntax, opts, ...)
end

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(M.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.get_python_path = function(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return exepath("python3") or exepath("python") or "python"
end

M.load = function()
  lspconfig.pyright.setup({
    capabilities = M.capabilities,
    on_attach = M.on_attach,
    flags = M.lsp_flags,
    before_init = function(_, config)
      config.settings.python.pythonPath = M.get_python_path(config.root_dir)
    end,
  })

  M.lsps = { "clangd", "hls" }

  for i, v in ipairs(M.lsps) do
    lspconfig[v].setup({
      capabilities = M.capabilities,
      on_attach = M.on_attach,
      flags = M.lsp_flags,
    })
  end
end

return M
