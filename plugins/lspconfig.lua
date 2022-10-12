-- local M = {}

-- M.setup_lsp = function(attach, capabilities)
--    local lsp_installer = require "nvim-lsp-installer"

--    lsp_installer.on_server_ready(function(server)
--       local opts = {
--          on_attach = attach,
--          capabilities = capabilities,
--          flags = {
--             debounce_text_changes = 150,
--          },
--          settings = {},
--       }

--       server:setup(opts)
--       vim.cmd [[ do User LspAttachBuffers ]]
--    end)
-- end

-- return M


-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "pyright"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
