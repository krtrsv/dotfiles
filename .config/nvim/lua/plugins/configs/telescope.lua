local telescope = require("telescope")

local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_ignore_patterns = {
      "^node_modules/",
      "^venv/",
      "^__pycache__/",
      "^_?build/",
      "^_?deps/",
      "^CMakeFiles/",
    },
    path_display = { "truncate" },
    border = {},
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  extensions_list = { "themes", "terms" },
}

telescope.setup(options)
