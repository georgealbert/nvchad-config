# nvchad-config
  macOS上基于NvChad的nvim配置。

## Install
   1. download `vimr` from https://github.com/qvacua/vimr

   2. clone `NvChad` repository from https://github.com/NvChad/NvChad
   ```sh
   git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
   ```

   3. clone the `nvchad-config` repository to `~/.config/nvim/custom`.
   ```sh
   git clone git@github.com:georgealbert/nvchad-config ~/.config/nvim/custom
   ```

## 增加的功能
### Find/Grep file in project
查找project的root dir时，用了`nvim-lspconfig`里的`util.find_git_ancestor()`。`nvim-lspconfig`是`NvChad`依赖的package。

## Default mapping

| Mappings       | Action                                               |
|----------------|------------------------------------------------------|
| `<C-x>/<C-s>`  | Save file                                            |
| `<C-c>/n`      | Telescope buffers                                    |
| `<leader>bb`   | Telescope buffers                                    |
| `<leader>bk`   | close buffer                                         |
| `<leader>fp`   | Find file in project                                 |
| `<leader>fd`   | Find file in current dir                             |
| `<D-r>`        | ("Option key"+r)grep file in project                 |
| `<D-f>`        | Grep file in current dir                             |
| `<C-c>/<C-/>`  | Comment current line                                 |

## 增加的plugin
### nvim-lsp-installer
### which-key
效果和emacs的`which-key`一样。非常流畅。
