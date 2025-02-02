local vscode = require "vscode"
local autocmd = vim.api.nvim_create_autocmd

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Global configs
vim.notify = vscode.notify
vim.g.mapleader = " "

-- Lazy Plugin setup
require("lazy").setup {
  spec = {
    {
      "numToStr/Comment.nvim",
      event = "VeryLazy",
      opts = {},
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}

vscode.notify "Hello from vscode.lua"

autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

vim.keymap.set(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment toggle" }
)

vim.keymap.set("n", "<leader>w", function()
  vscode.call "workbench.action.files.save"
  vscode.notify "Formatted and saved document"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>e", function()
  vscode.call "workbench.view.explorer"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>f", function()
  vscode.call "workbench.action.quickOpen"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>r", function()
  vscode.call "workbench.action.reloadWindow"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>g", function()
  vscode.call "workbench.view.scm"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<Tab>", function()
  vim.fn.VSCodeNotify "workbench.action.nextEditor"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<S-Tab>", function()
  vim.fn.VSCodeNotify "workbench.action.previousEditor"
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>c", function()
  vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end, { silent = true, noremap = true })

-- TODO: Panel navigation like tmux / vim-tmux-navigator
-- TODO: Search / Replace

