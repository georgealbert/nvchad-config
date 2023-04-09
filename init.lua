-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- https://vi.stackexchange.com/questions/5196/how-to-change-the-behavior-of-cursor-motions-ex-go-from-one-line-to-the-end-o
-- NvChad的cursor移动不合我的习惯，在emacs和vim中，到行末再按h和l时，cursor是不会移动到下一行的。
-- 在custom/chadrc.lua中设置无效，只能在custom/init.lua中设置
-- MacVim的whichwrap=b,s
vim.opt.whichwrap = "b,s"
