local util = require("formatter.util")

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    haskell = {
      require("formatter.filetypes.haskell").ormolu,
      function()
        return {
          exe = "ormolu",
          args = {
            "-i",
            util.escape_path(util.get_current_buffer_file_path()),
          },
        }
      end,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
      function()
        return {
          exe = "clang-format",
          args = {
            "--sort-includes",
            "--style=LLVM",
            "-i",
            util.escape_path(util.get_current_buffer_file_path()),
          },
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").black,
      function()
        return {
          exe = "black",
          args = {
            "--line-length 80",
            "--target-version py311",
            util.escape_path(util.get_current_buffer_file_path()),
          },
        }
      end,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
      function()
        return {
          exe = "stylua",
          args = {
            "--column-width 80",
            "--indent-type Spaces",
            "--indent-width 2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
})
