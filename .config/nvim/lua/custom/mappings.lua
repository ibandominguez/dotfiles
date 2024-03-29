---@type MappingsTable
local M = {}

M.git = {
  n = {
    ["<leader>g"] = { "+Git", opts = { silent = true } },
    ["<leader>gb"] = { ":Gitsigns blame_line <CR>", "Git blame", opts = { silent = true } },
    ["<leader>gg"] = { ":LazyGit <CR>", "LazyGit", opts = { silent = true } },
    ["<leader>gc"] = { ":Telescope git_commits <CR>", "Git commits", opts = { silent = true } },
  },
}

M.nvchad = {
  n = {
    ["<leader>n"] = { "+NvChad" },
    ["<leader>nd"] = { ":Nvdash <CR>", "Dashboard", opts = { silent = true } },
    ["<leader>nu"] = { ":NvChadUpdate <CR>", "Update", opts = { silent = true } },
    ["<leader>ns"] = { ":NvCheatsheet <CR>", "CheatSheet", opts = { silent = true } },
    ["<leader>nr"] = {
      function()
        require("plenary.reload").reload_module "custom.init"
      end,
      "Reload",
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
      "Run to cursor",
    },
    ["<leader>dg"] = {
      function()
        require("dap").session()
      end,
      "Get session",
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
      "Step back",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<leader>du"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },
    ["<leader>dt"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle repl",
    },
    ["<leader>dU"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle debug UI",
    },
  },
}

M.buffers = {
  n = {
    ["<leader>b"] = { "+Buffers" },
    ["<leader>bn"] = { ":edit " .. vim.fn.getcwd() .. "/", "New buffer" },
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
      "Close all",
    },
    ["<leader>bf"] = {
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      "Focus (close others)",
    },
    ["<leader>bh"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move current left",
    },
    ["<leader>bl"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move current right",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>s"] = { "+Search" },
    ["<leader>sa"] = {
      ":Telescope find_files follow=true no_ignore=true hidden=true <CR>",
      "Search all files",
      opts = { silent = true },
    },
    ["<leader>sb"] = { ":Telescope buffers <CR>", "Search buffers", opts = { silent = true } },
    ["<leader>sd"] = { ":Telescope diagnostics <CR>", "Search diagnostics", opts = { silent = true } },
    ["<leader>sf"] = { ":Telescope git_files <CR>", "Search files", opts = { silent = true } },
    ["<leader>sl"] = { ":Telescope resume <CR>", "Search last search", opts = { silent = true } },
    ["<leader>sh"] = { ":Telescope help_tags <CR>", "Search helptags", opts = { silent = true } },
    ["<leader>st"] = { ":Telescope live_grep <CR>", "Search text", opts = { silent = true } },
    ["<leader>su"] = { ":Telescope themes <CR>", "Search UI Themes", opts = { silent = true } },
    ["<leader>sm"] = { ":Telescope marks <CR>", "Search markers", opts = { silent = true } },
    ["<leader>sj"] = { ":Telescope jumplist <CR>", "Search jumps", opts = { silent = true } },
    ["<leader>sk"] = { ":Telescope keymaps <CR>", "Search keymaps", opts = { silent = true } },
    ["<leader>so"] = { ":Telescope oldfiles <CR>", "Search old files", opts = { silent = true } },
    ["<leader>sr"] = { ":Telescope registers <CR>", "Search registers", opts = { silent = true } },
    ["<leader>sc"] = {
      ":Telescope current_buffer_fuzzy_find <CR>",
      "Search in current buffer",
      opts = { silent = true },
    },
    ["<leader>ss"] = { ":Telescope spell_suggest <CR>", "Search spell suggestions", opts = { silent = true } },
    ["<leader>sx"] = { ":Telescope commands <CR>", "Search commands", opts = { silent = true } },
  },
}

M.lspconfig = {
  n = {
    ["gs"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
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
      "Write (formatting)",
    },
    ["<leader>f"] = { ":Telescope git_files <CR>", "Find files", opts = { silent = true } },
    ["<leader>h"] = { ":noh <CR>", "Hightlight (clear)", opts = { silent = true } },
    ["<leader>q"] = { ":q <CR>", "Quit", opts = { silent = true } },
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Explorer (toggle)", opts = { silent = true } },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (toggle)",
    },
  },
  v = {
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (toggle)",
    },
  },
  t = {
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Terminal (toggle)",
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
