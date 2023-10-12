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

M.debugging = {
  n = {
    ["<leader>d"] = { "+Debug" },
    ["<leader>ds"] = {
      function()
        require("dap").start()
      end,
      "Start",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    ["<leader>dC"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run To Cursor",
    },
    ["<leader>dg"] = {
      function()
        require("dap").session()
      end,
      "Get Session",
    },
    ["<leader>dd"] = {
      function()
        require("dap").disconnect()
      end,
      "Disconnect",
    },
    ["<leader>dq"] = {
      function()
        require("dap").quit()
      end,
      "Quit",
    },
    ["<leader>db"] = {
      function()
        require("dap").step_back()
      end,
      "Step Back",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<leader>du"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<leader>dt"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle Repl",
    },
    ["<leader>dU"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle DebugUI",
    },
  },
}

M.buffers = {
  n = {
    ["<leader>b"] = { "+Buffers" },
    ["<leader>bn"] = { "TODO: Newbuffer" },
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
    ["<leader>s"] = { "+Search" },
    ["<leader>sa"] = { ":Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find AllFiles" },
    ["<leader>sb"] = { ":Telescope buffers <CR>", "Find Buffers" },
    ["<leader>sd"] = { ":Telescope diagnostics <CR>", "Find Diagnostics" },
    ["<leader>sf"] = { ":Telescope git_files <CR>", "Find Files" },
    ["<leader>sl"] = { ":Telescope resume <CR>", "Find LastSearch" },
    ["<leader>sh"] = { ":Telescope help_tags <CR>", "Find HelpTags" },
    ["<leader>st"] = { ":Telescope live_grep <CR>", "Find Text" },
    ["<leader>su"] = { ":Telescope themes <CR>", "Find UIThemes" },
    ["<leader>sm"] = { ":Telescope marks <CR>", "Find Markers" },
    ["<leader>so"] = { ":Telescope oldfiles <CR>", "Find Oldfiles" },
    ["<leader>sr"] = { ":Telescope registers <CR>", "Find Registers" },
    ["<leader>sc"] = { ":Telescope current_buffer_fuzzy_find <CR>", "Find InCurrentBuffer" },
    ["<leader>sx"] = { ":Telescope commands <CR>", "Find Commands" },
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
    ["<leader>f"] = { ":Telescope git_files <CR>", "Find Files" },
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
    ["<leader>ch"] = "",
    ["<leader>b"] = "",
    ["<leader>d"] = "",
    ["<leader>dt"] = "",
    ["<leader>D"] = "",
    ["<leader>e"] = "",
    ["<leader>h"] = "",
    ["<leader>n"] = "",
    ["<leader>q"] = "",
    ["<leader>v"] = "",
    ["<leader>x"] = "",
    ["<leader>w"] = "",
    ["<leader>f"] = "",
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fm"] = "",
    ["<leader>fo"] = "",
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
