local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    enabled = true,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
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

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },

  {
     -- url = "git@github.com:X3eRo0/dired.nvim.git"
     "X3eRo0/dired.nvim",
     enabled = false,
     -- requires = "MunifTanjim/nui.nvim",
     config = function()
        require("dired").setup {
           path_separator = "/",
           show_banner = false,
           show_hidden = true,
           show_dot_dirs = true,
           show_colors = true,
        }
     end,
  },

  {
     -- url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
     "nvim-telescope/telescope-fzf-native.nvim"
  },

  {
     url = "git@github.com:luukvbaal/nnn.nvim",
     enabled = false,
     cmd = { "NnnExplorer", "NnnPicker" },
     config = function()
        require("nnn").setup()
     end,
  },
}

return plugins
