local M = {}

-- https://vi.stackexchange.com/questions/5196/how-to-change-the-behavior-of-cursor-motions-ex-go-from-one-line-to-the-end-o
-- nvchad的cursor移动不合我的习惯，在emacs和vim中，到行末再按h和l时，cursor是不会移动到下一行的。
-- lua/core/options.lua里面是直接写死的，改了不生效。

-- local opt = vim.opt
-- MacVim的whichwrap=b,s
-- whichwrap=b,s

M.options = {
   -- nvchad默认400ms，太快了，nvim默认是1000ms
   -- 用了which-key后，要设置小点，500ms吧
   timeoutlen = 500,
}

M.plugins = {
   status = {
      -- bufferline = false, -- manage and preview opened buffers
      better_escape = false, -- map to <ESC> with no lag
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

-- so setup_lspconf = "custom.plugins.lspconfig" as per our example

return M
