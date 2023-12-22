# nvchad-config
macOS上基于`NvChad`的nvim配置。

## Install

1. download `vimr` from https://github.com/qvacua/vimr
当前版本为：`v0.42.2-20220913.230838`

貌似`vimr`是在macOS上比较好的`neovim`的实现。

2. clone `NvChad` repository from https://github.com/NvChad/NvChad
当前版本为：`dc66931`
```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

3. clone the `nvchad-config` repository to `~/.config/nvim/custom`.
```sh
git clone git@github.com:georgealbert/nvchad-config ~/.config/nvim/lua/custom
```

## 增加的功能
### Find/Grep file in project
查找project的root dir时，用了`nvim-lspconfig`里的`util.find_git_ancestor()`。`nvim-lspconfig`是`NvChad`依赖的package。

## Default mapping

| Mappings      | Action                               |
|---------------|--------------------------------------|
| `<C-x>/<C-s>` | Save file                            |
| `<leader>bb`  | Telescope buffers                    |
| `<leader>bk`  | close buffer                         |
| `<leader>fp`  | Find file in project                 |
| `<leader>fd`  | Find file in current dir             |
| `<leader>fl`  | Code formatting using null-ls.nvim   |
| `<D-r>`       | ("Option key"+r)grep file in project |
| `<D-f>`       | Grep file in current dir             |

## 内置plugin

### nvim-treesitter
#### 如何安装language的parser

1. 修改了`~/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/lua/nvim-treesitter/shell_command_selectors.lua`里面的curl的参数， "-x http://127.0.0.1:7890",
2. `:TSInstallSync cpp java` 才行，用`TSInstall`就报错
3. language的动态链接库在`~/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/parser`目录下

> 必须用代理，curl下载会一直报错，唉

### mason

#### 如何安装lua-language-server

`mason`比`nvim-treesitter`除了默认可以用curl下载，也会用wget，curl和wget都可以通过配置文件设置proxy。

```sh
$cat ~/.curlrc 
proxy="http://127.0.0.1:7890"
```

```sh
cat ~/.wgetrc 
http_proxy = http://127.0.0.1:7890/
https_proxy = http://127.0.0.1:7890/
use_proxy = on
# wait = 15
```

### null-ls.nvim

用于format代码。其他功能未使用

1. python
使用`autopep8`，使用`pip install autopep8`进行安装。

## 增加的plugin

### _nvim-lsp-installer_ - 改为meson.vim
安装lsp server方便多了。

### which-key - 已内置
键绑定实在是太多了，记不住。用了`which-key`以后，爽了。效果和emacs的`which-key`一样。非常流畅。

## TODO
### Telescope的模糊查询
为什么查询的结果这么奇怪，`keyword1 keyword2`这样的查询结果太多了。和emacs的ivy的查询习惯相差太大了。

用了fzf后，fuzzy = false，貌似没效果

用 'abc 才可以精确匹配。

如何知道是否用了fzf，没地方查

### magit - neogit 不好用
找到一个vim中的`magit` https://github.com/TimUntersberger/neogit，有空试试。

### 代码浏览时gd、gi跳转后怎么回到原来的代码上？

## 题外话
### git

1. proxy

国内如果不设置代理，上github犹如登天。如果不用代理，也可以在clone时用ssh方式，或者在已经clone的repo中修改`.git/config`把https方式改为ssh方式。如果要commit代码，那必须是ssh方式。

```sh
# 设置proxy
git config --global http.proxy 'socks5://127.0.0.1:7890'
git config --global https.proxy 'socks5://127.0.0.1:7890'

# 取消proxy
git config --global --unset http.proxy
git config --global --unset https.proxy
```

2. autocrlf
   
macos中，如果不设置autocrlf，checkout时，vim文件经常是dos格式的，导致nvchad的telescope等多个plugin不生效。

```sh
git config --global core.autocrlf input
```

使用`dos2unix`命令批量修改已checkout的vim的行结束符为`LF`。`dos2unix`可以通过`brew install dos2unix`来安装。
```sh
find . -name '*.vim' -exec dos2unix {} \;
```

### whichwrap
在emacs和vim中，习惯移动到行首行末时，cursor不会移动到上一行或下一行。`NvChad`把`whichwrap`改为`<,>,h,l,b,s`了，vim的`whichwrap`默认是`b,s`。只能在`lua/core/options.lua`注释掉或者`:set whichwrap=b,s`。

### popupmenukeys
总是记不住在popup menu里面如何选择和删除。如 `:edit ~/` 时怎么选择补全

可以看help `:help popup-menu-keys`。

| Mappings | Action                                                        |
|----------|---------------------------------------------------------------|
| `C-y`    | Yes: Accept the currently selected match and stop completion. |
| `C-w`    | 删除补全内容，如果有`/`，会先删除，再按一次删除到上级目录     |
| `C-n`    | Select the next match                                         |
| `C-p`    | Select the previous match                                     |
