-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
--   CursorLine = {
--     bg = "black2",
--   },
  Comment = {
    -- fg = "red",
    italic = true,
  },

  -- DiffChange = { fg = "white", bg = "yellow", italic = true },
  -- NvimTreeOpenedFolderName = { fg = "red", bold = true },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  -- GitGutterChange = { fg = colors.red },
  -- GitGutterChange = { fg = "red", bg = "white", italic = true },
  -- GitGutterChange = { fg = "red", italic = true },
}

return M
