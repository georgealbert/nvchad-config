# nvchad-config
  基于NvChad的nvim配置。

## Install
   clone the `nvchad-config` repository to `~/.config/nvim/custom`.

   ```sh
   git clone https://github.com/georgealbert/nvchad-config ~/.config/nvim/custom
   ```

## find/grep file in project
   查找project的root dir时，用了`nvim-lspconfig`里的`util.find_git_ancestor()`。`nvim-lspconfig`是`NvChad`依赖的package。
