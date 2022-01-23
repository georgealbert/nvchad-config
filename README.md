# nvchad-config
  基于NvChad的nvim配置。

## Install
   clone the `nvchad-config` repository to `~/.config/nvim/custom`.

   ```sh
   git clone https://github.com/georgealbert/nvchad-config ~/.config/nvim/custom
   ```

## find/grep file in project
   查找project的root dir时，用了`nvim-lspconfig`里的`util.find_git_ancestor()`。`nvim-lspconfig`是`NvChad`依赖的package。

## which-key

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
