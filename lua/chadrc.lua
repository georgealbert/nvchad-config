-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = {
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- theme = "vscode_colored",
    -- theme = "vscode",
    -- theme = "minimal",
    --     -- default/round/block/arrow separators work only for default statusline theme
    --     -- round and block will work for minimal theme only
    --     separator_style = "default",
    --     -- separator_style = "arrow",

    modules = {
      -- cursor = function()
      --     return "%#StText# %l:%c %p%% "
      --     -- return "%#StText# %l:%c %P "
      -- end,
      --
      cursor = function()
        local fn = vim.fn
        local sep_l = ""
        local current_line = fn.line "."
        local total_line = fn.line "$"

        -- local col = fn.virtcol "."

        -- local chad = string.format(" %d:%d", current_line, col) .. " │ "
        -- local chad = string.format(" %d:%d", current_line, col) .. " "
        local chad = " %l:%v | "
        -- local chad = " %l:%v | %p%%"
        -- local chad = " %l:%c | %P"

        -- default cursor_position module
        local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

        local text = math.modf((current_line / total_line) * 100) .. tostring "%%"
        text = string.format("%4s", text)

        text = (current_line == 1 and "Top") or text
        text = (current_line == total_line and "Bot") or text

        return left_sep .. "%#St_pos_text#" .. chad .. text .. " "
        -- return left_sep .. "%#St_pos_text#" .. chad
      end,
    },
  },
}

return M
