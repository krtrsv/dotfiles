local M = {}

local vi_mode = require("feline.providers.vi_mode")

local colors = {
  black = "#181a1f",
  bg = "#282c34",
  fg = "#abb2bf",
  purple = "#c678dd",
  green = "#98c379",
  orange = "#d19a66",
  blue = "#61afef",
  yellow = "#e5c07b",
  cyan = "#56b6c2",
  red = "#e86671",
  grey = "#5c6370",
}

local LEFT = 1
local RIGHT = 2

local mode_colors = {
  ["NORMAL"] = "green",
  ["COMMAND"] = "yellow",
  ["INSERT"] = "blue",
  ["REPLACE"] = "red",
  ["LINES"] = "purple",
  ["VISUAL"] = "purple",
  ["OP"] = "yellow",
  ["BLOCK"] = "purple",
  ["V-REPLACE"] = "purple",
  ["ENTER"] = "yellow",
  ["MORE"] = "yellow",
  ["SELECT"] = "yellow",
  ["SHELL"] = "yellow",
  ["TERM"] = "yellow",
  ["NONE"] = "yellow",
}

local sep_space = function()
  return {
    str = " ",
    hl = function()
      return { bg = vi_mode.get_mode_color() }
    end,
  }
end

local get_components = function()
  local components = {
    active = { {}, {} },
    inactive = { {}, {} },
  }
  table.insert(components.active[LEFT], {
    provider = "vi_mode",
    icon = "",
    hl = function()
      return {
        name = vi_mode.get_mode_highlight_name(),
        bg = vi_mode.get_mode_color(),
        fg = "black",
        style = "bold",
      }
    end,
    left_sep = sep_space(),
    right_sep = sep_space(),
  })

  table.insert(
    components.active[LEFT],
    { provider = "file_info", right_sep = " ", left_sep = " " }
  )

  table.insert(components.active[LEFT], {
    provider = function()
      return ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc)
        .. " | "
        .. ((vim.bo.fileformat ~= "" and vim.bo.fileformat) or vim.o.fileformat)
    end,
    hl = function()
      return { bg = vi_mode.get_mode_color(), fg = "black" }
    end,
    left_sep = sep_space(),
    right_sep = sep_space(),
  })

  table.insert(
    components.active[LEFT],
    { provider = "diagnostic_errors", hl = { fg = "red" } }
  )
  table.insert(
    components.active[LEFT],
    { provider = "diagnostic_warnings", hl = { fg = "yellow" } }
  )
  table.insert(
    components.active[LEFT],
    { provider = "diagnostic_hints", hl = { fg = "green" } }
  )
  table.insert(
    components.active[LEFT],
    { provider = "diagnostic_info", hl = { fg = "blue" } }
  )

  table.insert(
    components.active[RIGHT],
    {
      provider = "git_diff_added",
      icon = "+",
      right_sep = " ",
      hl = { fg = "green" }
    }
  )
  table.insert(
    components.active[RIGHT],
    {
      provider = "git_diff_changed",
      icon = "~",
      right_sep = " ",
      hl = { fg = "orange" }
    }
  )
  table.insert(
    components.active[RIGHT],
    {
      provider = "git_diff_removed",
      icon = "-",
      right_sep = " ",
      hl = { fg = "red" }
    }
  )

  table.insert(components.active[RIGHT], {
    provider = "git_branch",
    icon = "",

    left_sep = sep_space(),
    hl = function()
      return { bg = vi_mode.get_mode_color(), fg = "black" }
    end,
  })

  table.insert(components.active[RIGHT], {
    provider = "line_percentage",
    hl = function()
      return { bg = vi_mode.get_mode_color(), fg = "black" }
    end,
    left_sep = sep_space(),
    right_sep = sep_space(),
  })

  table.insert(components.active[RIGHT], {
    provider = "position",
    padding = { line = 2, col = 2 },
    hl = function()
      return { bg = vi_mode.get_mode_color(), fg = "black" }
    end,
    right_sep = sep_space(),
  })

  table.insert(
    components.inactive[LEFT],
    { name = "filename_inactive", provider = "file_info" }
  )
  return components
end

M.setup = function()
  require("feline").setup({
    theme = colors,
    components = get_components(),
    vi_mode_colors = mode_colors,
  })
end

return M
