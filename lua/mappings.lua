require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map("i", "jk", "<ESC>")

map("n", "<space>cn", ":Telescope file_browser path=%:p:h respect_gitignore=false select_buffer=true previewer=false initial_mode=normal<CR>",
    { desc = "telescope file browser" })

-- 和<leader>b有冲突，先不用了
-- map("n", "<leader>bk", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<space>gg", ":Gitsigns blame<CR>", { desc = "Gitsigns blame" })
map("n", "<space>gh", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Gitsigns current_line_blame" })
