local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

autocmd({ "VimEnter" }, {
  callback = function(data)
    if data.file == "" then
      vim.cmd "Nvdash"
    elseif vim.fn.isdirectory(data.file) == 1 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
