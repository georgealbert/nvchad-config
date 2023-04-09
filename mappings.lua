---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<space>cn"] = {":Telescope file_browser path=%:p:h respect_gitignore=false hidden=false select_buffer=true previewer=false initial_mode=normal<CR>", opts = { noremap = true }},
  },
}

-- more keybinds!

return M
