return {
   ['TimUntersberger/neogit'] = {
      module = "neogit",
      -- cmd = {'Neogit'},
   },

   ['nvim-telescope/telescope-fzf-native.nvim'] = {
     run = 'make',
     after = "telescope.nvim",
     config = function ()
        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important
       require('telescope').setup {
         extensions = {
            fzf = {
               fuzzy = false,                    -- false will only do exact matching
               override_generic_sorter = true,  -- override the generic sorter
               override_file_sorter = true,     -- override the file sorter
               case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
               -- the default case_mode is "smart_case"
            }
         }
       }
       -- To get fzf loaded and working with telescope, you need to call
       -- load_extension, somewhere after setup function:
       require('telescope').load_extension('fzf')
     end
   },

   -- https://github.com/folke/which-key.nvim
   ['folke/which-key.nvim'] = {
      disable = false,
   },

   ["neovim/nvim-lspconfig"] = {
      config = function()
         require "plugins.configs.lspconfig"
         require "custom.plugins.lspconfig"
      end,
   },

   ["williamboman/mason.nvim"] = {
      override_options = {
         ensure_installed = {
            -- lua stuff
            "lua-language-server",
            -- "stylua",

            -- web dev
            -- "css-lsp",
            -- "html-lsp",
            -- "typescript-language-server",
            -- "deno",
            -- "emmet-ls",
            -- "json-lsp",

            -- shell
            -- "shfmt",
            -- "shellcheck",
            -- python
            "pyright",
            "bash-language",
         },
      },
   },

   -- code formatting, linting etc
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
}
