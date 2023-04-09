local M = {}

M.treesitter = {
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
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
   extensions = {
      fzf = {
         fuzzy = false,                    -- false will only do exact matching
         override_generic_sorter = true,  -- override the generic sorter
         override_file_sorter = true,     -- override the file sorter
         case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
         -- the default case_mode is "smart_case"
      },
      -- file_browser = {
      --    -- theme = "dropdown",
      --    mappings = {
      --       ["n"] = {
      --          -- your custom normal mode mappings
      --          -- ["+"] = require("telescope._extensions.file_browser.actions").create,
      --          -- ["h"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
      --          ["/"] = function()
      --             vim.cmd('startinsert')
      --          end
      --       },
      --    },
      -- },
   },
   extensions_list = { "themes", "terms", "file_browser", "fzf" },
}

M.tabufline = {
   show_numbers = true,
}

return M
