---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- ["<space>cn"] = {":Telescope file_browser path=%:p:h respect_gitignore=false hidden=false select_buffer=true previewer=false initial_mode=normal<CR>", opts = { noremap = true }},
    ["<space>cn"] = {":Telescope file_browser path=%:p:h respect_gitignore=false select_buffer=true previewer=false initial_mode=normal<CR>", opts = { noremap = true }},
    ["<F2>"] = {":Telescope software-licenses find<CR>"},
  },
  t = {
    ["<F2>"] = {"<c-\\><c-n>:Telescope software-licenses find<CR>"},
    -- ["<F2>"] = {":Telescope software-licenses find<CR>"},
  },
}

-- more keybinds!

return M
