---@type NvPluginSpec[]
local plugins = {

  -- Core nvad plugins overwride

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          local null_ls = require "null-ls"
          local builtins = null_ls.builtins
          null_ls.setup {
            debug = true,
            sources = {
              builtins.formatting.deno_fmt.with { extra_args = { "--no-semicolons", "--line-width", "120" } }, -- Fast!
              builtins.formatting.prettier.with { filetypes = { "html", "markdown", "css", "json" } }, -- Prettier only these filetypes
              builtins.formatting.stylua,
              builtins.formatting.clang_format,
            },
          }
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities
      local lspconfig = require "lspconfig"
      local default_servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss" } -- Add servers for default config
      for _, lsp in ipairs(default_servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- init = function()
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 0
    -- end,
  },

  -- Pass opts but use core defaults

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "css-lsp",
        "html-lsp",
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
    opts = {
      git = { enable = true },
      renderer = {
        highlight_git = true,
        icons = {
          git_placement = "signcolumn",
          show = { git = true },
        },
      },
    },
  },

  -- Custom Plugins

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
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
    config = function()
      require("lazy").setup {
        { "kdheepak/lazygit.nvim" },
      }
    end,
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

return plugins
