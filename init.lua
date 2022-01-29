-- This is an example init file , its supposed to be placed in /lua/custom/

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

-- https://vi.stackexchange.com/questions/5196/how-to-change-the-behavior-of-cursor-motions-ex-go-from-one-line-to-the-end-o
-- nvchad的cursor移动不合我的习惯，在emacs和vim中，到行末再按h和l时，cursor是不会移动到下一行的。

-- MacVim的whichwrap=b,s
vim.opt.whichwrap = "b,s"

-- MAPPINGS
local map = require("core.utils").map

ffip = {} -- Find file in project. global variable, module name.

function ffip.find_file_in_dir(opts)
  opts = opts or {}
  opts.cwd = vim.fn.expand('%:p:h')
  opts.no_ignore = true

  require'telescope.builtin'.find_files(opts)
end

function ffip.find_file_in_project(opts)
  opts = opts or {}

  local util = require("lspconfig.util")
  local current_dir = vim.fn.expand('%:p:h')
  local root_dir = util.find_git_ancestor(current_dir)

  if not root_dir then
    print("Could not find the project root. Create a git repository there fisrt. Dir: " .. current_dir)
    return
  end

  opts.cwd = root_dir
  opts.no_ignore = true
  require'telescope.builtin'.find_files(opts)
end

function ffip.grep_file_in_dir(opts)
  opts = opts or {}
  -- opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  opts.cwd = vim.fn.expand('%:p:h')
  require'telescope.builtin'.live_grep(opts)
end

-- https://github.com/nvim-telescope/telescope.nvim/issues/592
-- https://github.com/nvim-telescope/telescope.nvim/issues/502
function ffip.grep_file_in_project(opts)
  opts = opts or {}
  local util = require("lspconfig.util")
  local current_dir = vim.fn.expand('%:p:h')
  local root_dir = util.find_git_ancestor(current_dir)
  -- print("buffer: " .. vim.fn.expand('%:p:h'))
  -- print("root: " .. lspPlugin.find_git_ancestor(vim.fn.expand('%:p:h')))
  -- print("root: " .. lspPlugin.find_git_ancestor("/Users/albert/.config/nvim/lua/custom/init.lua"))
  -- print("root_dir: " .. root_dir)
  -- opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if not root_dir then
    print("Could not find the project root. Create a git repository there fisrt. Dir: " .. current_dir)
    return
  end

  opts.cwd = root_dir
  require'telescope.builtin'.live_grep(opts)
end

--
-- key mapping
--
map("n", "<leader>cc", ":Telescope <CR>")

-- map("n", "<leader>bb", ":Telescope buffers<CR>")
-- map("n", "<leader>bk", ":lua require('core.utils').close_buffer() <CR>") -- close  buffer

-- map("n", "<C-c>n", ":Telescope buffers<CR>")

map("n", "<C-x><C-s>", ":w <CR>")

map("n", "<C-c><C-/>", ":lua require('Comment.api').toggle_current_linewise()<CR>")
map("v", "<C-c><C-/>", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")


map("n", "<leader>fd", ":lua ffip.find_file_in_dir()<CR>")
map("n", "<leader>fp", ":lua ffip.find_file_in_project()<CR>")
map("n", "<D-f>", ":lua ffip.grep_file_in_dir()<CR>")
map("n", "<D-r>", ":lua ffip.grep_file_in_project()<CR>")

map("n", "<C-x>g", ":lua require('neogit').open({ kind = 'vsplit', cwd = vim.fn.expand('%:p:h') })<CR>")

-- map("n", "<leader>q", ":q <CR>")
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
      use {
         "williamboman/nvim-lsp-installer",
         -- opt = true
         -- lazy_load = true,
      }

      use {
        "TimUntersberger/neogit",
        -- opt = true,
        -- cmd = {'Neogit'},
      }

      -- https://github.com/folke/which-key.nvim
      use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      }
end)

--
-- which-key's key mapping.
--
local wk = require("which-key")

wk.register({
  b = {
    name = "file&buffers", -- optional group name
    b = { "<cmd>Telescope buffers<cr>", "buffers" },
    k = { ":lua require('core.utils').close_buffer() <CR>", "close buffer"}
  },
}, { prefix = "<leader>" })

wk.register({
  n = { "<cmd>Telescope buffers<cr>", "buffers" },
  -- "<C-/>" = {":lua require('Comment.api').toggle_current_linewise()<CR>", "comment"},
}, { prefix = "<C-c>" })

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
