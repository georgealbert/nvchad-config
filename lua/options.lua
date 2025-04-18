require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- https://vi.stackexchange.com/questions/5196/how-to-change-the-behavior-of-cursor-motions-ex-go-from-one-line-to-the-end-o
-- NvChad的cursor移动不合我的习惯，在emacs和vim中，到行末再按h和l时，cursor是不会移动到下一行的。
-- 在custom/chadrc.lua中设置无效，只能在custom/init.lua中设置
-- MacVim的whichwrap=b,s
vim.opt.whichwrap = "b,s"

-- https://github.com/lewis6991/gitsigns.nvim/wiki/FAQ
vim.api.nvim_set_hl(0, 'GitsignsCurrentLineBlame', { fg = 'white', bg = 'black' })
-- vim.api.nvim_set_hl(0, 'GitsignsCurrentLineBlame', { link = 'Todo' })

-- markdown fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
