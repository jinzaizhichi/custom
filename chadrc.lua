---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'gruvbox'}
 M.plugins = "custom.plugins"
 -- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}
M.mappings = require "custom.mappings"
 return M
