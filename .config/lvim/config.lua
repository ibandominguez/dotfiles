-- General config
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

-- Keymapping setup
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-\\>"] = ":ToggleTerm<CR>"

-- Keymapping unset
-- vim.keymap.del("n", "<C-Up>")

-- Keymapping override
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Builtin plugins configs (Reset LunarVim, Run :Lazy install changes)
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Lsp Setting, ensured installed
lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "cssls",
  "html",
  "tailwindcss",
  "eslint",
  "tsserver",
  "jsonls",
  "pylsp"
}

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  {
    name = "prettier",
    args = { "--print-width", "100", "--trailing-comma", "none", "--no-semi", "--single-quote" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
  },
  {
    name = "phpcsfixer",
    filetypes = { "php" }
  },
}

-- Linters
local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
  {
    name = "standardjs",
    filetypes = { "javascript", "javascriptreact" }
  },
  {
    name = "tsc",
    filetypes = { "typescript", "typescriptreact" }
  }
}

-- User Plugins
lvim.plugins = {
  { "editorconfig/editorconfig-vim" },  -- Editorconfig support
  { "mg979/vim-visual-multi" },         -- Multicursors (Sublime, VSCode like) C-n
  { "christoomey/vim-tmux-navigator" }, -- Tmux and Vim navigation using Ctrl+(jkhl)
  { "tpope/vim-surround" },             -- https://github.com/tpope/vim-surround
  -- Live Diagnostics on typing
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".on_attach()
    end
  },
  -- Auto close and renames tags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- Experimental UI (Command line, search and messages)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true
          }
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        }
      })
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap"
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end
-- })
