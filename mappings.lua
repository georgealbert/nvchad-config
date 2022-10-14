-- lua/custom/mappings 
local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  n = {
      ["<leader>b"] = "",
      -- ["<C-c>"] = "",
  }
}

M.telescope = {
  n = {
     ["<leader>bb"] = {"<cmd> Telescope buffers <CR>", "find buffers"},
  },

  i = {
    -- more keys!
  },
}

M.general = {
   -- stuff
   n = {
      -- ["<C-c>n"] = {"<cmd> Telescope Buffers <CR>", "Open Buffers"},
      ["<C-x><C-s>"] = {"<cmd> w <CR>", "save file"},
      ["<leader>bk"] = {
         function()
            require("nvchad_ui.tabufline").close_buffer()
         end,
         "close buffer",
      },
      ["<leader>fl"] = {
         function()
            require("vim.lsp.buf").formatting()
         end,
         "null-ls formatting",
      },
   },
}

return M
