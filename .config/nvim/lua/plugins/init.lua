return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   -- init = function()
  --   --   vim.o.timeout = true
  --   --   vim.o.timeoutlen = 0
  --   -- end,
  -- },

  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "phpactor",
        "typescript-language-server",
        "deno",
        "prettier",
        "tailwindcss-language-server",
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "php",
        "markdown",
        "markdown_inline",
      },
      indent = {
        enable = true,
        -- disable = { "python" },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      git = { enable = true },
      renderer = {
        highlight_git = true,
        icons = {
          git_placement = "signcolumn",
          show = { git = false },
        },
      },
    },
  },

  {
    "mg979/vim-visual-multi", -- Multicursors (Sublime, VSCode like) C-n
    event = "VeryLazy",
  },

  {
    "christoomey/vim-tmux-navigator", -- Tmux and Vim navigation using Ctrl+(jkhl)
    event = "VeryLazy",
  },

  {
    "tpope/vim-surround", -- https://github.com/tpope/vim-surround
    event = "VeryLazy",
  },

  {
    "windwp/nvim-ts-autotag", -- Auto close and renames tags
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim", -- LazyGit within neovim
    event = "VeryLazy",
  },

  {
    "folke/noice.nvim", -- Experimental UI (Command line, search and messages)
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },

  {
    "princejoogie/chafa.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    config = function()
      require("chafa").setup {
        render = {
          min_padding = 5,
          show_label = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}
