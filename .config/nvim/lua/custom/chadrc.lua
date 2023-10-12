---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "github_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

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

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
