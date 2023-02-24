# Neovim配置

## Neovim的安装

- 具体可以看[这里](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Neovim的使用

### 先决条件

1. 安装git,gcc,unzip,sqlite3,node等基础工具，Windows下推荐使用Msys2安装基础工具，Msys2官网在[这里](https://www.msys2.org)

2. 确保网络环境没有问题，要能正常访问github,否则插件安装很麻烦。

### 安装插件

- linux:

- 打开终端输入: `git clone https://github.com/uniful/lazynvim.git ~/.config/nvim`

- windows:

- 打开PowerShell输入: `git clone https://github.com/uniful/lazynvim.git $env:LOCALAPPDATA\nvim`

- **注意**

- 在此配置中，某些插件需要自己更改一下路径或配置。直接启动Neovim，插件安装过程会报错。

- 修改如下：(注意：不要直接使用neovim来修改，否则插件将会直接安装，并且报错，可以使用vim/nano/emacs/helix等文本编辑器)

1. HighStr：在plugins/visualext.lua里面修改为你自定义的位置

2. 由于需要sqlite，Windows用户需要sqlite3.dll，详情可在[sqlite.lua](https://github.com/kkharji/sqlite.lua)中查看

### 完成

- 修改完成后，在终端输入nvim,插件便会自动安装

## lsp和dap以及自动完成

### lsp

- lsp服务可以自行安装，也可以通过mason安装，由于本人用的是archlinux,安装语言服务比较方便，包也新，所以并没有使用Mason.nvim。

- 使用其它Linux发行版如Ubuntu等，则通过mason安装比较方便，如果电脑上还没有安装语言服务器，则在plugins/lspconfig.lua文件中，修改配置，详细配置请看[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

## completion

- 此配置中使用的是nvim-cmp作为自动补全框架

### dap

- dap服务其实吧，不怎么好用，用于调试c/c++还行。调试配置在debugger文件夹。

- 自定义调试器

1. 在debugger/lang/dap-cpp.lua文件中, 修改你使用的c/c++调试适配器, 具体可以看[dap](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation),自己选择自己需要的适配器，然后修改就可以了。

2. dap-lua.lua文件基本上不用修改.
