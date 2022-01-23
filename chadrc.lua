local M = {}

M.options = {
   -- nvchad默认400ms，太快了，nvim默认是1000ms
   -- 用了which-key后，要设置小点，500ms吧
   timeoutlen = 500,
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

-- so setup_lspconf = "custom.plugins.lspconfig" as per our example

return M
