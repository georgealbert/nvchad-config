vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Neovide
-- see ~/.local/share/nvim/neovide-settings.json
-- https://github.com/akioito/dotfiles/blob/master/vim/.config/nvim/lua/configs.lua#L5-L28
if vim.g.neovide then
  vim.o.guifont = "FantasqueSansMono Nerd Font:h16"

  vim.g.neovide_cursor_animation_length = 0

  vim.g.neovide_input_macos_alt_is_meta = true

  vim.g.neovide_cursor_antialiasing = false
  -- 这个貌似设置了以后，cursor移动感觉不卡了
  vim.g.neovide_refresh_rate = 20
  -- vim.g.neovide_refresh_rate_idle = 5

  -- vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true

  -- 这个挺有意思的，可以显示FPS
  -- vim.g.neovide_profiler = true

  -- https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
  -- https://github.com/neovide/neovide/issues/1263
  -- I can't use the cmd+v to paste text on my mac; #1263
  -- Allow clipboard copy paste in neovim

  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  -- vim.keymap.set('c', '<D-v>', '<C-R>*') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- 为什么在minibuffer用 command-v 就粘贴不进去呢？
  -- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  -- vim.api.nvim_set_keymap('c', '<D-v>', '<C-R>+', { noremap = true, silent = true}) -- Paste command mode

  -- https://neovide.dev/configuration.html#ime
  local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
  end

  local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
      group = ime_input,
      pattern = "*",
      callback = set_ime
  })

  vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
      group = ime_input,
      pattern = "[/\\?]",
      callback = set_ime
  })
end
