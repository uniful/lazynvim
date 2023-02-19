# Neovim配置介绍

## Neovim介绍

> Vim is a powerful text editor with a big community that is constantly growing. Even though the editor is about two
> decades old,
people still extend and want to improve it, mostly using Vimscript or one of the supported scripting languages.[Neovim
Introduction](https://github.com/neovim/neovim/wiki/Introduction)
- Neovim is a project that seeks to aggressively refactor Vim source code in order to achieve the following goals:
1. Simplify maintenance to improve the speed that bug fixes and features get merged.
2. Split the work among multiple developers.
3. Enable the implementation of new/modern user interfaces without any modifications to the core source.
4. Improve the extensibility power with a new plugin architecture based on coprocesses. Plugins will be written in any
   programming language without any explicit support from the editor.

## Neovim的安装 > 具体可以看[这里](https://github.com/neovim/neovim/wiki/Installing-Neovim)
### windows：
- 使用包管理器:
(stable)
1. winget install Neovim.Neovim
2. scoop install neovim
(Development)
1. winget install Neovim.Neovim.Nightly
2. scoop install neovim-nightly
- 推荐使用stable
### Linux
1. Arch : sudo pacman -S neovim
2. Ubuntu/Debian/Linux Mint : sudo apt install neovim
3. Fedora : sudo dnf install neovim
### MacOS
- 直接去官网看教程吧。

## 使用
### 先决条件
1. 安装git,gcc,unzip等基础工具，Windows下推荐使用Msys2安装基础工具，Msys2官网在[这里](https://www.msys2.org)
2. 确保网络环境没有问题，要能正常访问github,否则插件安装很麻烦。
### 配置
- 在linux下将这段命令复制到终端命令工具 git clone https://github.com/uniful/lazynvim.git ~/.config/nvim
- 如果是windows10/11用户，则进入%LocalAppData%,新建一个nvim文件夹，然后在nvim文件夹里面打开终端,
输入这段指令:git clone https://github.com/uniful/lazynvim.git
- 由于在这个配置中，我自己改了一些东西，直接启动Neovim，插件安装会报错，需要先修改一下里面的东西。
- 自行修改如下：(注意：不要直接使用neovim来修改，否则插件将会直接安装，并且报错，可以使用vim/nano/emacs/helix等)
1. alpha-nvim,由于我自己在此插件里面修改了一些布局样式，并且命名为dashboardt.lua,所以要修改回来，在plugins/cover.lua文件下，将dashboardt改为dashboard
2. HighStr,在plugins/highstr.lua里面修改为你自己的位置
3. telescope,在plugins/inquiry.lua中修改history、frecency的位置，*其实在inquiry.luaz中frecency这段可以直接删除，我自己懒得改了*
4. 如果是windows用户，则使用sqlite的时候需要修改一些东西，详情可在[sqlite.lua](https://github.com/kkharji/sqlite.lua)中查看
### 完成
- 修改完成后，在终端输入nvim,插件便会自动安装

## lsp和dap以及自动完成
### lsp
- lsp服务可以自行安装，也可以通过mason安装，由于本人用的是archlinux,安装语言服务比较方便，包也新，使用其它Linux发行版
或者使用Windows，则通过mason安装比较方便，如果电脑上还没有安装语言服务器，则在plugins/mason.lua文件中，安装所需要的服务器
详细配置请看[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim),其实挺简单的。
### dap
- dap服务其实吧，不怎么好用，用于调试c/c++还行。调试配置在debugger/dap-config.lua文件中。
- 自定义调试器配置
1. 在dap-cpp.lua文件中, 修改你使用的调试适配器, 具体可以看[dap](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation),自己选择自己需要的适配器，然后修改就可以了。
2. dap-lua.lua文件基本上不用修改.
