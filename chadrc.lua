local M = {}

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

return M
