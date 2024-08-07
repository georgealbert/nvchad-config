return {
   {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      config = function()
         require "configs.conform"
      end,
   },

   {
      "nvim-telescope/telescope.nvim",
      opts = {
         defaults = {
            -- 滚动到顶和底时不会循环
            scroll_strategy = "limit",
         },
      },
   },

   {
      "nvim-telescope/telescope-file-browser.nvim",
      -- enabled = false,
      -- event = "InsertEnter",
      config = function()
         local fb_actions = require "telescope._extensions.file_browser.actions"

         require("telescope").setup {
            extensions = {
               file_browser = {
                  -- path
                  -- cwd
                  -- cwd_to_path = false,
                  -- grouped = false,
                  -- files = true,
                  -- add_dirs = true,
                  -- depth = 1,
                  -- auto_depth = false,
                  -- select_buffer = false,
                  hidden = false,
                  -- respect_gitignore
                  -- browse_files
                  -- browse_folders
                  hide_parent_dir = false,
                  collapse_dirs = false,
                  prompt_path = true,
                  -- quiet = false,
                  -- dir_icon = "",
                  -- dir_icon_hl = "Default",
                  -- display_stat = { date = true, size = true, mode = true },
                  -- hijack_netrw = false,
                  -- use_fd = true,
                  -- git_status = true,
                  mappings = {
                     ["i"] = {
                        --    ["<A-c>"] = fb_actions.create,
                        --    ["<S-CR>"] = fb_actions.create_from_prompt,
                        --    ["<A-r>"] = fb_actions.rename,
                        --    ["<A-m>"] = fb_actions.move,
                        --    ["<A-y>"] = fb_actions.copy,
                        --    ["<A-d>"] = fb_actions.remove,
                        --    ["<C-o>"] = fb_actions.open,
                        ["<C-h>"] = fb_actions.goto_parent_dir,
                        --    ["<C-e>"] = fb_actions.goto_home_dir,
                        --    ["<C-w>"] = fb_actions.goto_cwd,
                        --    ["<C-t>"] = fb_actions.change_cwd,
                        --    ["<C-f>"] = fb_actions.toggle_browser,
                        ["<C-g>"] = fb_actions.toggle_hidden,
                        --    ["<C-s>"] = fb_actions.toggle_all,
                        -- ["<bs>"] = fb_actions.backspace,
                     },
                     ["n"] = {
                        ["+"] = fb_actions.create,
                        -- ["r"] = fb_actions.rename,
                        -- ["m"] = fb_actions.move,
                        -- ["y"] = fb_actions.copy,
                        -- ["d"] = fb_actions.remove,
                        -- ["o"] = fb_actions.open,
                        ["h"] = fb_actions.goto_parent_dir,
                        -- ["e"] = fb_actions.goto_home_dir,
                        -- ["w"] = fb_actions.goto_cwd,
                        -- ["t"] = fb_actions.change_cwd,
                        -- ["f"] = fb_actions.toggle_browser,
                        ["g"] = fb_actions.toggle_hidden,
                        -- ["s"] = fb_actions.toggle_all,
                        ["/"] = function()
                           vim.cmd('startinsert')
                        end,
                     },
                  },
               },
            },
                                    }
      end,
   },

   {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
   },
   
   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = {
            "lua-language-server", "stylua",
            -- web dev stuff
            -- "css-lsp", "html-lsp", "typescript-language-server", "deno",
         },
      },
   },

   {
      "nvim-treesitter/nvim-treesitter",
      opts = {
         ensure_installed = {
            "vim",
            "lua",
            "html",
            "css",
            "javascript",
            "c",
            "markdown",
            "markdown_inline",
         },
         indent = {
            enable = true,
            disable = {
               "python"
            },
         },
      },
   },

   {
      "nvim-tree/nvim-tree.lua",
      opts = {
         view = {
            adaptive_size = true,
         },
         git = {
            enable = false,
         },
         renderer = {
            root_folder_label = ":~:s?$?/..?",
            highlight_git = true,
            icons = {
               show = {
                  git = true,
               },
               glyphs = {
                  folder = {
                     default = "",
                  },
               },
            },
         },
      },
   },
}
