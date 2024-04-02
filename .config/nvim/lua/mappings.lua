-- If you want to load default mappings
-- require "nvchad.mappings"

-- Mapping
local map = vim.keymap.set

-- Examples
-- map("i", "<C-k>", "<Up>", { desc = "Move up" })
-- map({ "i", "n" }, "<C-k>", "<Up>", { desc = "Move down" })
-- map("n", "<leader>ff", ":Telescope <cr>")
-- map("n", "<A-i>", function()
--   require("nvchad.term").toggle({ pos = "sp", id ='abc' })
-- end, { desc = "Terminal toggle floating" })

-- Unmapping
local unmap = vim.keymap.del

-- Examples
-- unmap("n", "<leader>m")
-- unmap({ "n", "v" }, "<leader>m")

-- General
map("n", "<leader>w", function()
  vim.lsp.buf.format { async = false }
  vim.cmd "w"
end, { desc = "Write (Formatting)" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next tab" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Prev tab" })

map("n", "<leader>f", ":Telescope git_files <CR>", { desc = "Find files", silent = true })
map("n", "<leader>h", ":noh <CR>", { desc = "Hightlight (clear)", silent = true })
map("n", "<leader>q", ":q <CR>", { desc = "Quit", silent = true })
map("n", "<leader>e", ":NvimTreeToggle <CR>", { desc = "Explorer (toggle)", silent = true })

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

map({ "n", "i", "v", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal (toggle)" })

-- Git
map("n", "<leader>g", "+Git")
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Git LazyGit" })

-- NvChad
map("n", "<leader>n", "+NvChad")
map("n", "<leader>nd", ":Nvdash<cr>", { desc = "Dashboard" })
map("n", "<leader>nu", ":NvChadUpdate<cr>", { desc = "Update" })
map("n", "<leader>ns", ":NvCheatsheet<cr>", { desc = "CheatSheet" })
map("n", "<leader>nr", function()
  require("plenary.reload").reload_module "init"
end, { desc = "Reload" })

-- Telescope
map("n", "<leader>s", "+Search")
map(
  "n",
  "<leader>sa",
  ":Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Search all files" }
)
map("n", "<leader>sb", ":Telescope buffers <CR>", { desc = "Search buffers" })
map("n", "<leader>sd", ":Telescope diagnostics <CR>", { desc = "Search diagnostics" })
map("n", "<leader>sf", ":Telescope git_files <CR>", { desc = "Search files" })
map("n", "<leader>sl", ":Telescope resume <CR>", { desc = "Search last (resume)" })
map("n", "<leader>sh", ":Telescope help_tags <CR>", { desc = "Search helptags" })
map("n", "<leader>st", ":Telescope live_grep <CR>", { desc = "Search text" })
map("n", "<leader>su", ":Telescope themes <CR>", { desc = "Search UI Themes" })
map("n", "<leader>sm", ":Telescope marks <CR>", { desc = "Search markers" })
map("n", "<leader>sj", ":Telescope jumplist <CR>", { desc = "Search jumps" })
map("n", "<leader>sk", ":Telescope keymaps <CR>", { desc = "Search keymaps" })
map("n", "<leader>so", ":Telescope oldfiles <CR>", { desc = "Search old files" })
map("n", "<leader>sr", ":Telescope registers <CR>", { desc = "Search registers" })
map("n", "<leader>sc", ":Telescope current_buffer_fuzzy_find <CR>", { desc = "Search in current buffer" })
map("n", "<leader>ss", ":Telescope spell_suggest <CR>", { desc = "Search spell suggestions" })
map("n", "<leader>sx", ":Telescope commands <CR>", { desc = "Search commands" })

-- LSP
map("n", "gs", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })

map("n", "gl", function()
  local float = vim.diagnostic.config().float
  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"
    vim.diagnostic.open_float(config)
  end
end, { desc = "Show line diagnostics" })

-- M.debugging = {
--   n = {
--     ["<leader>d"] = { "+Debug" },
--     ["<leader>ds"] = {
--       function()
--         require("dap").start()
--       end,
--       "Start",
--     },
--     ["<leader>dp"] = {
--       function()
--         require("dap").pause()
--       end,
--       "Pause",
--     },
--     ["<leader>dc"] = {
--       function()
--         require("dap").continue()
--       end,
--       "Continue",
--     },
--     ["<leader>dC"] = {
--       function()
--         require("dap").run_to_cursor()
--       end,
--       "Run to cursor",
--     },
--     ["<leader>dg"] = {
--       function()
--         require("dap").session()
--       end,
--       "Get session",
--     },
--     ["<leader>dd"] = {
--       function()
--         require("dap").disconnect()
--       end,
--       "Disconnect",
--     },
--     ["<leader>dq"] = {
--       function()
--         require("dap").quit()
--       end,
--       "Quit",
--     },
--     ["<leader>db"] = {
--       function()
--         require("dap").step_back()
--       end,
--       "Step back",
--     },
--     ["<leader>di"] = {
--       function()
--         require("dap").step_into()
--       end,
--       "Step into",
--     },
--     ["<leader>do"] = {
--       function()
--         require("dap").step_over()
--       end,
--       "Step over",
--     },
--     ["<leader>du"] = {
--       function()
--         require("dap").step_out()
--       end,
--       "Step out",
--     },
--     ["<leader>dt"] = {
--       function()
--         require("dap").toggle_breakpoint()
--       end,
--       "Toggle breakpoint",
--     },
--     ["<leader>dr"] = {
--       function()
--         require("dap").repl.toggle()
--       end,
--       "Toggle repl",
--     },
--     ["<leader>dU"] = {
--       function()
--         require("dapui").toggle()
--       end,
--       "Toggle debug UI",
--     },
--   },
-- }
--

-- Buffers
map("n", "<leader>b", "+Buffers")
map("n", "<leader>bn", ":edit " .. vim.fn.getcwd() .. "/", { desc = "New buffer" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

map("n", "<leader>bq", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Close all" })

map("n", "<leader>bf", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Focus (close others)" })

map("n", "<leader>bh", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move current left" })

map("n", "<leader>bl", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move current right" })
