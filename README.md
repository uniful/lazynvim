# Neovim配置

- **注意**

- 本配置需要调整一下设置

1. rnvimr插件：用于在浮动窗口调用ranger，由于windows用户无法使用ranger，则需要删除此插件

2. sqlite.lua插件：由于Telescope frecency和yanky.nvim，以及一些其它功能需要sqlite，所以请在[sqlite.lua](https://github.com/kkharji/sqlite.lua)中查看详细配置

3. HighStr插件：在plugins/visualext.lua文件中，调整highstr插件的具体路径

4. 需要说明的是，在将此配置使用之前，需要先修改这些设置，neovim使用会报错

## Neovim的安装

- 具体可以看[这里](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## Neovim的使用

### 先决条件

1. 确保系统中有git,gcc,unzip,node等基础工具，Windows下推荐使用Msys2安装基础工具，Msys2官网在[这里](https://www.msys2.org)

2. 确保网络环境没有问题，要能正常访问github,否则插件安装很麻烦。

### 安装插件

- linux:

- 打开终端输入: `git clone https://github.com/uniful/lazynvim.git ~/.config/nvim`

- windows:

- 打开PowerShell输入: `git clone https://github.com/uniful/lazynvim.git $env:LOCALAPPDATA\nvim`

- 之后，删除.git文件夹。在终端输入nvim，插件便会自动安装

## 基础插件介绍

### lsp(Language Server Protocol)

- 此协议定义了在编辑器或IDE与语言服务器之间使用的协议，该语言服务器提供了例如自动补全，转到定义，查找所有引用等的功能

- 语言服务器可以自行安装，也可以通过mason.nvim插件安装。

- 使用mason.nvim安装语言服务

1. 具体需要安装的语言服务可以去mason.nvim插件的地址[mason.nvim](https://github.com/williamboman/mason.nvim)查看

2. 在plugins/lspconfig.lua文件中修改需要补全的服务器，在下方的排除列表中进行取消，则mason.nvim插件会自行安装所需的服务。

- 自行安装语言服务

1. 去nvim-lspconfig的语言服务列表[server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)中查看

2. 不需要的语言服务器可以在plugins/lspconfig.lua文件中删除

### completion

- 此配置中使用的是nvim-cmp作为自动补全框架，基本补全设置已经够用了

### dap

- dap服务其实吧，不怎么好用，用于调试c/c++还行。调试配置在debugger文件夹。

- 自定义调试器

1. 在debugger/lang/dap-cpp.lua文件中, 修改你使用的c/c++调试适配器, 具体可以看[dap](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation),自己选择自己需要的适配器，然后修改就可以了。

2. dap-lua.lua文件基本上不用修改.

3. 如果不想neovim实现调试功能，则可以删除debugger文件夹内所有文件，以及plugins/dap.lua文件。

### treesitter

- treesitter语法高亮感觉比自带的好多了，不过要感觉更好看，还需要你自己搭配一套主题，我默认使用的kanagawa，感觉还不错。

- 如果想更换主题，可以去treesitter的插件官网[Colorschemes](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes)查看

### 更多插件查找

- 插件列表[neovim-awesome](https://github.com/rockerBOO/awesome-neovim)

## 启动优化

- 在我的WSL2的ArchLinux上进行测试，基本打开时间在70ms左右，感觉已经可以了。
