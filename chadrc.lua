local M = {}

-- 最坑爹的是没有 custom/plugins/configs.lua 的时候，chadrc.lua加载会报错，但是没有任何提示
-- 导致我查了很久才发现有问题，可以用pcall
-- local plugin_conf = require "custom.plugins.configs"

-- loading custom/plugins/init.lua
-- local userPlugins = require "custom.plugins"

local present, userPlugins = pcall(require, "custom.plugins")
if not present then
  vim.notify("Error loading custom/plugins/init.lua\n\n" .. userPlugins)
end

-- :lua print(vim.inspect(require"custom.plugins"))
-- :lua print(vim.inspect(require"custom.chadrc".plugins.install))

-- Print table(userPlugins)
-- vim.notify("Loading custom/plugins/init.lua, table(userPlugins): \n\n" .. vim.inspect(userPlugins))

M.options = {
  -- nvchad默认400ms，太快了。MacVim默认是1000ms
  -- which-key推荐500ms
  timeoutlen = 500,
}

M.plugins = {
  status = {
    colorizer = true,
    better_escape = false, -- map to <ESC> with no lag
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  default_plugin_config_replace = {
    nvim_tree = {
      view = {
        -- side = "right",
        width = 30,
        hide_root_folder = false,
        mappings = {
          list = {
            { key = "^", action = "dir_up" },
            { key = "+", action = "create" },
          },
        },
      },
    },
  },

  install = userPlugins,
}

M.mappings = {
  misc = {
    copy_to_system_clipboard = "", -- copy selected text (visual mode) or curent line (normal)
  }
}

-- M.ui = {
--    theme = "gruvchad",
-- }

return M
