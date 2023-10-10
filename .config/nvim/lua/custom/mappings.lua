---@type MappingsTable
local M = {}

M.git = {
  n = {
    ["<leader>g"] = { "+Git" },
    ["<leader>gb"] = { ":Gitsigns blame_line <CR>", "GitBlame Line" },
    ["<leader>gg"] = { ":LazyGit <CR>", "LazyGit" },
    ["<leader>gc"] = { ":Telescope git_commits <CR>", "Git Commits" },
  },
}

M.nvchad = {
  n = {
    ["<leader>n"] = { "+NvChad" },
    ["<leader>nd"] = { ":Nvdash <CR>", "Nvdash" },
    ["<leader>nu"] = { ":NvChadUpdate <CR>", "NvChad Update" },
    ["<leader>ns"] = { ":NvCheatsheet <CR>", "NvChad CheatSheet" },
    ["<leader>nr"] = {
      function()
        require("plenary.reload").reload_module "custom.init"
      end,
      "NvChad Reload",
    },
  },
}

M.buffers = {
  n = {
    ["<leader>b"] = { "+Buffers" },
    ["<leader>bn"] = {
      function()
        print "TODO!!!!!"
      end,
      "New buffer",
    },
    ["<leader>bc"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>bq"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Buffers CloseAll",
    },
    ["<leader>bh"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Buffers MoveLeft",
    },
    ["<leader>bl"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Buffers MoveRight",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = { "+Find" },
    ["<leader>fa"] = { ":Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find All" },
    ["<leader>fb"] = { ":Telescope buffers <CR>", "Find Buffers" },
    ["<leader>fd"] = { ":Telescope diagnostics <CR>", "Find Diagnostics" },
    ["<leader>ff"] = { ":Telescope git_files <CR>", "Find Files" },
    ["<leader>fl"] = { ":Telescope resume <CR>", "Find LastSearch" },
    ["<leader>fh"] = { ":Telescope help_tags <CR>", "Find HelpTags" },
    ["<leader>ft"] = { ":Telescope live_grep <CR>", "Find Text" },
    ["<leader>fu"] = { ":Telescope themes <CR>", "Find UIThemes" },
    ["<leader>fm"] = { ":Telescope marks <CR>", "Find Markers" },
    ["<leader>fo"] = { ":Telescope oldfiles <CR>", "Find Oldfiles" },
    ["<leader>fr"] = { ":Telescope registers <CR>", "Find Registers" },
    ["<leader>fc"] = { ":Telescope current_buffer_fuzzy_find <CR>", "Find InCurrentBuffer" },
    ["<leader>fx"] = { ":Telescope commands <CR>", "Find Commands" },
  },
}

M.lspconfig = {
  n = {
    ["gs"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP SignatureHelp",
    },
    ["gl"] = {
      function()
        local float = vim.diagnostic.config().float
        if float then
          local config = type(float) == "table" and float or {}
          config.scope = "line"
          vim.diagnostic.open_float(config)
        end
      end,
      "Show line diagnostics",
    },
  },
}

M.general = {
  n = {
    ["<leader>w"] = {
      function()
        vim.lsp.buf.format { async = false }
        vim.cmd "w"
      end,
      "Write (Formatting)",
    },
    ["<leader>h"] = { ":noh <CR>", "Hightlight Clear" },
    ["<leader>q"] = { ":q <CR>", "Quit" },
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Explorer (Toggle)" },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (Toggle)",
    },
  },
  v = {
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (Toggle)",
    },
  },
  t = {
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (Toggle)",
    },
  },
}

M.disabled = {
  n = {
    ["<leader>c"] = "",
    ["<leader>cc"] = "",
    ["<leader>ca"] = "",
    ["<leader>cm"] = "",
    ["<leader>b"] = "",
    ["<leader>D"] = "",
    ["<leader>e"] = "",
    ["<leader>h"] = "",
    ["<leader>n"] = "",
    ["<leader>q"] = "",
    ["<leader>v"] = "",
    ["<leader>x"] = "",
    ["<leader>w"] = "",
    ["<leader>f"] = "",
    ["<leader>fw"] = "",
    ["<leader>fz"] = "",
    ["<leader>l"] = "",
    ["<leader>ls"] = "",
    ["<leader>cu"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>rn"] = "",
    ["<leader>p"] = "",
    ["<leader>pt"] = "",
    ["<leader>ph"] = "",
    ["<leader>m"] = "",
    ["<leader>ma"] = "",
    ["<leader>r"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>t"] = "",
    ["<leader>td"] = "",
    ["<leader>th"] = "",
    ["<leader>g"] = "",
    ["<leader>gb"] = "",
    ["<leader>gt"] = "",
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-s>"] = "",
    ["<C-c>"] = "",
    ["<C-n>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
    ["<Esc>"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
  },
}

return M
