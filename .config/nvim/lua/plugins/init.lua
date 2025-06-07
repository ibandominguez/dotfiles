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
        "csharp_ls",
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
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
          signature = {
            enabled = false,
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

  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter", -- Or any other trigger you prefer
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          debounce = 500,
          auto_trigger = true,
          max_lines = 3,
          keymap = {
            accept = "<C-l>", -- customize keybinding for accepting suggestions
            prev = "<C-k>", -- previous suggestion
            next = "<C-j>", -- next suggestion
          },
        },
      }
    end,
  },

  -- Hi  -- Cursor AI neovim integration:
  -- https://www.youtube.com/watch?v=4kzSV2xctjc
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = { provider = "copilot" },
    -- opts = {
    --  provider = "ollama",
    --  ollama = {
    --    model = "deepseek-coder:1.3b",
    --    endpoint = "http://127.0.0.1:11434",
    --  }
    -- },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
