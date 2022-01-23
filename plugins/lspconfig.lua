-- local M = {}

-- M.setup_lsp = function(attach, capabilities)
--    local lspconfig = require "lspconfig"

--    -- lspservers with default config
--    local servers = { "html", "cssls", "pyright" }

--    for _, lsp in ipairs(servers) do
--       lspconfig[lsp].setup {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--       }
--    end
   
--    -- typescript
--    -- lspconfig.tsserver.setup {
--    --    on_attach = function(client, bufnr)
--    --       client.resolved_capabilities.document_formatting = false
--    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
--    --    end,
--    -- }

-- -- the above tsserver lspconfig will remvoe the tsserver's inbuilt formatting,since I use null-ls with denofmt for formatting ts/js.
-- end

-- return M

local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
