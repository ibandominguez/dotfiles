-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "chocolate",
  theme_toggle = { "chocolate", "onenord_light" },

  hl_override = {
    Comment = {
      italic = true,
    },
  },

  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },

  lsp_semantic_tokens = true, -- required for tailwindcss lsp to work

  nvdash = {
    buttons = {
      { "  Find File", "Spc f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc s o", "Telescope oldfiles" },
      { "󰈭  Find Text", "Spc s t", "Telescope live_grep" },
      { "  Bookmarks", "Spc s m", "Telescope marks" },
      { "  UiThemes", "Spc s u", "Telescope themes" },
      { "  Mappings", "Spc n s", "NvCheatsheet" },
    },
  },
}

return M
