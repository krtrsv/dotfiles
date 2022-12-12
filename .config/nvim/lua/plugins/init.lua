require("paq")({
  "lewis6991/impatient.nvim",

  -- UI
  "navarasu/onedark.nvim",
  "nvim-lualine/lualine.nvim",
  "feline-nvim/feline.nvim",
  "akinsho/bufferline.nvim",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "lewis6991/gitsigns.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-refactor",

  -- Lsp
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "phaazon/hop.nvim",
  "elixir-editors/vim-elixir",

  -- Utils
  "mhartington/formatter.nvim",
  "norcalli/nvim-colorizer.lua",
  "numToStr/Comment.nvim",
  "tpope/vim-surround",
  "windwp/nvim-autopairs",
})

require("onedark").setup({
  transparent = true
})
require('onedark').load()

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
  },
})

require("indent_blankline").setup({
  char = "▏",
})

require("gitsigns").setup({
  current_line_blame = true,
})

require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

require("nvim-tree").setup({
  renderer = {
    icons = {
      git_placement = "after",
      show = {
        folder = false,
      },
    },
  },
})

require("plugins.configs.telescope")
require("plugins.configs.cmp")
require("plugins.configs.treesitter")
require("plugins.configs.lsp").load()
require("plugins.configs.formatter")
require("plugins.configs.feline").setup()

require("colorizer").setup()
require("Comment").setup()
require("nvim-autopairs").setup()
